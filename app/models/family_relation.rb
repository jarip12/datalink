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

    def build_one_link(src_id, src_name, dest_id, dest_name)
      {
          source: {
              id: src_id,
              name: src_name
          },
          target: {
              id: dest_id,
              name: dest_name
          }
      }
    end

    def have_at_least_one_parent(archive)
      parents = FamilyRelation.where(relation_name: ['father', 'mother'], family_related_id: archive.family_related.id)
      parents.count > 0
    end


    def build_tree_data(archive)
      have_children = false
      have_parent = false
      invisble_parent_tree_id = -1
      invisble_child_tree_id = -1
      father_id = nil
      mother_id = nil
      mine_id = nil
      spouse_id = nil

      node_data = {
          name: '',
          id: 1,
          avatar_link: '',
          hidden: true,
          children: []
      }

      tree_id = 2

      father = FamilyRelation.find_by(relation_name: 'father', family_related_id: archive.family_related.id)
      ap father
      if father
        node_data[:children].append({
          job: '父亲',
          name: father.realname,
          id: tree_id,
          avatar_link: father.avatar_url,
          no_parent: true })
        father_id = tree_id
        tree_id += 1
        have_parent = true
      end



      node_data[:children].append({
          name: '',
          id: tree_id,
          no_parent: true,
          hidden: true,
          avatar_link: '',
          children: []
                                   })
      invisble_parent_tree_id = tree_id
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
          avatar_link: archive.profile.avatar_url,
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
                                                     avatar_link: '',
                                                     children: []
                                                 })
      invisble_child_tree_id = tree_id
      tree_id += 1

      #add children
      my_children_data, new_tree_id = my_children(archive, tree_id)
      if new_tree_id > tree_id
        node_data[:children][-1][:children][-1][:children].concat(my_children_data)
        tree_id = new_tree_id
        have_children = true
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
                                         avatar_link: spouse.avatar_url,
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
                                         avatar_link: mother.avatar_url,
                                         id: tree_id,
                                         no_parent: true })
        mother_id = tree_id
        tree_id += 1
        have_parent = true
      end

      ap node_data
      link_data = []
      if father_id and mother_id
       link_data.append(build_one_link(father_id, father.realname, mother_id, mother.realname))
      elsif father_id
        link_data.append(build_one_link(father_id, father.realname, invisble_parent_tree_id, ''))
      elsif mother_id
        link_data.append(build_one_link(invisble_parent_tree_id, '', mother_id, mother.realname))
      end

      if spouse_id
       link_data.append(build_one_link(mine_id, archive.profile.realname, spouse_id, ''))
      elsif have_children
        link_data.append(build_one_link(mine_id, archive.profile.realname, invisble_child_tree_id, ''))
      end

      ap link_data
      node_ta = transform(node_data)

      return node_data, link_data

    end

    def transform(node_data)
      if node_data[:children].count == 1 && node_data[:children][0][:hidden]
        #remove blank parent
        nodes = node_data[:children][0][:children]
        node_data[:children] = nodes
      end
      ap node_data
      node_data
    end

  end



  def profile
    Profile.find_by_id_no(self.id_no) if id_no
  end

  def avatar_url
    if profile
      profile.avatar_url
    else
      ''
    end
  end

end
