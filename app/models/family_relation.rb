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
  enumerize :relation_name, in: [:stepfather, :stepmother, :adoptive_mother, :adoptive_father, :father, :mother, :uncle, :cousinly, :cousin, :old_sister, :young_sister, :old_brother, :young_brother, :son, :daughter], default: :father


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
      tree_data = children.each do | child |
        {
            job: child.relation_name_text,
            name: child.realname,
            id: tree_start_id
        }
        tree_start_id += 1
      end
      return tree_data, tree_start_id
    end

    def my_sibling(archive, tree_start_id)
      siblings = FamilyRelation.where(relation_name: ['young-sister', 'old-sister', 'young-brother', 'old-brother'], family_related_id: archive.family_related.id)
      tree_data = siblings.each do | sibling |
        {
            job: sibling.relation_name_text,
            name: sibling.realname,
            id: tree_start_id
        }
        tree_start_id += 1
      end
      return tree_data, tree_start_id
    end


    def build_tree_data(archive)
      family_relations = archive.family_related.family_relations
      tree_data = {
          name: '',
          id: 1,
          hidden: true,
          children: []
      }

      tree_id = 2

      father = FamilyRelation.find_by(relation_name: 'father', family_related_id: archive.family_related.id)
      ap father
      if father
        tree_data[:children].append({
          job: '父亲',
          name: father.realname,
          id: tree_id,
          no_parent: true })
          tree_id += 1
      end

      tree_data[:children].append({
          name: '',
          id: tree_id,
          no_parent: true,
          hidden: true,
          children: []
                                   })
      tree_id += 1

      #add sibling nodes
      my_sibling_data, new_tree_id = my_sibling(archive, tree_id)
      if new_tree_id > tree_id
        tree_data[:children][-1][:children].append(my_sibling_data)
      end
      ap my_sibling_data

      #add self node
      tree_data[:children][-1][:children].append({
          name: archive.profile.realname,
          id: tree_id,
          children: []
                                      })
      tree_id += 1

      my_children_data, new_tree_id = my_children(archive, tree_id)
      tree_id = new_tree_id

      ap my_children_data

      tree_data[:children][-1]

      mother = FamilyRelation.find_by(relation_name: 'mother', family_related_id: archive.family_related.id)
      ap mother
      if mother
        tree_data[:children].append({
                                         job: '母亲',
                                         name: mother.realname,
                                         id: tree_id,
                                         no_parent: true })
        tree_id += 1
      end

      ap tree_data

      tree_data

    end

  end



  def profile
    Profile.find_by_id_no(self.id_no) if id_no
  end

end
