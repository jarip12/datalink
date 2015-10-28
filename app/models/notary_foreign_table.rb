# == Schema Information
#
# Table name: notary_foreign_tables
#
#  id                    :integer          not null, primary key
#  realname              :string(255)
#  sex                   :integer
#  age                   :integer
#  id_no                 :integer
#  use_country           :string(255)
#  now_address           :text(65535)
#  before_abroad_address :text(65535)
#  abroad_day            :date
#  notary_type           :string(255)
#  notary_type_info      :string(255)
#  translate_lang        :string(255)
#  email                 :string(255)
#  mobile                :string(255)
#  file_num              :integer
#  require_notary        :boolean          default(TRUE)
#  photo_num             :integer
#  work_unit             :text(65535)
#  birth_day             :date
#  comment               :text(65535)
#  agent_name            :string(255)
#  agent_relation        :string(255)
#  agent_mobile          :string(255)
#  agent_address         :text(65535)
#  sync_status           :string(255)
#  purpose               :string(255)
#  user_id               :integer
#  user_verified         :boolean          default(FALSE)
#  reserve_at            :datetime
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#

class NotaryForeignTable < ActiveRecord::Base
  belongs_to :user

  extend Enumerize
  enumerize :sync_status, in: [:wait_allow, :pending, :success], default: :wait_allow
  enumerize :sex, in: [:male, :female], default: :male

  has_many :notary_relations
  accepts_nested_attributes_for :notary_relations, allow_destroy: true



  delegate :server_token, to: Setting

  class << self
    def sync_to_server
      ap "exec sync_to_server"
      ap Setting.sync_notary_foreign_table_url

      pending_tables = NotaryForeignTable.where(sync_status: "pending")
      ap pending_tables.count
      pending_tables.each do |table|
        response = Excon.post(Setting.sync_notary_foreign_table_url,
                   :body => table.to_json(:methods => :server_token),
                   :headers => { "Content-Type" => "application/json" })

        body = JSON.parse(response.body)
        ap body['success']
        if response.status == 200 and body['success'] == true
          table.sync_status = "success"
          table.save!
          ap "notary_foreign_table #{table.id} saved"
        else
          ap body
        end

      end

    end
  end

end
