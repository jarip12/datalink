# == Schema Information
#
# Table name: family_relations
#
#  id                :integer          not null, primary key
#  id_no             :string(255)
#  realname          :string(255)
#  relation_name     :string(255)
#  family_related_id :integer
#  synced            :boolean          default(FALSE)
#  updated_once      :boolean          default(FALSE)
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

class FamilyRelation < ActiveRecord::Base

  extend Enumerize
  enumerize :relation_name, in: [:spouse, :stepfather, :stepmother, :adoptive_mother, :adoptive_father, :father, :mother, :uncle, :cousinly, :cousin, :old_sister, :young_sister, :old_brother, :young_brother, :son, :daughter], default: :father


  validates :realname, realname: true
  validates :relation_name, presence: true
  validates :id_no, id_no: true
  validates_uniqueness_of :id_no


  delegate :client_token, to: Setting

  class << self
    def sync_to_user_system
      family_relations = FamilyRelation.where(synced: false)
      family_relation_ids = family_relations.pluck('id')

      family_relations.each do |family_relation|
        ap family_relation.to_json
        response = Excon.post(Setting.sync_family_relation_url,
                            :body => family_relation.to_json(:methods => :client_token),
                            :headers => { "Content-Type" => "application/json" })

        body = JSON.parse(response.body)
        if response.status == 200 and body["success"]
          FamilyRelation.where(id: family_relation_ids).update_all(synced: true)
        else
          ap body
        end
      end
    end

    def my_children(archive, tree_start_id)
      children = FamilyRelation.where(relation_name: ['son', 'daughter'], family_related_id: archive.family_related.id)
      node_data = children.each_with_index.map do | child, index |
        {
            job: child.relation_name_text,
            name: child.realname,
            id: tree_start_id + index
        }
      end
      return node_data, tree_start_id + children.count
    end

    def my_sibling(archive, tree_start_id)
      siblings = FamilyRelation.where(relation_name: ['young_sister', 'old_sister', 'young_brother', 'old_brother'], family_related_id: archive.family_related.id)
      node_data = siblings.each_with_index.map do | sibling, index |
        {
            job: sibling.relation_name_text,
            name: sibling.realname,
            id: tree_start_id + index
        }
      end
      return node_data, tree_start_id + siblings.count
    end


    def build_tree_data(archive)
      node_data = {
          name: '',
          id: 1,
          hidden: true,
          children: []
      }
      father_id = nil, mother_id = nil, mine_id = nil, spouse_id = nil

      tree_id = 2

      father = FamilyRelation.find_by(relation_name: 'father', family_related_id: archive.family_related.id)
      ap father
      if father
        node_data[:children].append({
          job: '父亲',
          name: father.realname,
          id: tree_id,
          no_parent: true })
        father_id = tree_id
        tree_id += 1
      end

      node_data[:children].append({
          name: '',
          id: tree_id,
          no_parent: true,
          hidden: true,
          children: []
                                   })
      tree_id += 1

      #add sibling nodes
      my_sibling_data, new_tree_id = my_sibling(archive, tree_id)
      ap "sibling_node is "
      ap my_sibling_data
      if new_tree_id > tree_id
        node_data[:children][-1][:children].concat(my_sibling_data)
        tree_id = new_tree_id
      end

      #add self node
      node_data[:children][-1][:children].append({
          name: archive.profile.realname,
          id: tree_id,
          children: []
                                      })
      mine_id = tree_id
      tree_id += 1

      #add empty node, used to concat children
      node_data[:children][-1][:children].append({
                                                     name: "",
                                                     id: tree_id,
                                                     hidden: true,
                                                     no_parent: true,
                                                     children: []
                                                 })
      tree_id += 1

      #add children
      my_children_data, new_tree_id = my_children(archive, tree_id)
      if new_tree_id > tree_id
        node_data[:children][-1][:children][-1][:children].concat(my_children_data)
        tree_id = new_tree_id
      end
      ap "children data is "
      ap my_children_data

      #add wift or husband
      spouse = FamilyRelation.find_by(relation_name: 'spouse', family_related_id: archive.family_related.id)
      ap spouse
      if spouse
        node_data[:children][-1][:children].append({
                                         job: '配偶',
                                         name: spouse.realname,
                                         id: tree_id,
                                         no_parent: true })
        spouse_id = tree_id
        tree_id += 1
      end


      mother = FamilyRelation.find_by(relation_name: 'mother', family_related_id: archive.family_related.id)
      ap mother
      if mother
        node_data[:children].append({
                                         job: '母亲',
                                         name: mother.realname,
                                         id: tree_id,
                                         no_parent: true })
        mother_id = tree_id
        tree_id += 1
      end

      ap node_data
      link_data = []
      if father_id and mother_id
       link_data.append({
           source: {
               id: father_id,
               name: father.realname
           },
           target: {
               id: mother_id,
               name: mother.realname
           }
                        })
      end

      if spouse_id
       link_data.append({
           source: {
               id: mine_id,
               name: archive.profile.realname
           },
           target: {
               id: spouse_id,
               name: spouse.realname
           }
                        })
      end

      ap link_data

      return node_data, link_data

    end

  end



  def profile
    Profile.find_by_id_no(self.id_no) if id_no
  end

end
