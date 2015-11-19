# == Schema Information
#
# Table name: notary_foreign_tables
#
#  id                    :integer          not null, primary key
#  realname              :string(255)
#  sex                   :string(255)
#  age                   :integer
#  id_no                 :string(255)
#  use_country           :string(255)
#  now_address           :text(65535)
#  before_abroad_address :text(65535)
#  abroad_day            :date
#  translate_lang        :string(255)
#  email                 :string(255)
#  mobile                :string(255)
#  file_num              :integer
#  require_notary        :string(255)
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
#  notary_use            :string(255)
#  reserve_day           :string(255)
#  reservation_id        :integer
#  reserve_hour          :string(255)
#  notary_record_id      :integer
#  user_verified         :boolean          default(FALSE)
#  reserve_at            :datetime
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#

class NotaryForeignTable < ActiveRecord::Base
  belongs_to :user
  belongs_to :reservation

  extend Enumerize
  enumerize :require_notary, in: [:required, :not_required]
  enumerize :sync_status, in: [:wait_allow, :pending, :success], default: :wait_allow

  enumerize :sex, in: [:male, :female]
  enumerize :notary_use, in: [:settle, :visit_family, :work, :learn, :marry, :other], default: :settle

  has_many :notary_relations
  has_many :notary_types
  accepts_nested_attributes_for :notary_relations, :notary_types, allow_destroy: true

  delegate :server_token, to: Setting


  class << self
    def sync_to_server
      ap "exec sync_to_server"


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

    def has_notary_type_info?(value)
      ['family_relation', 'retire', 'health', 'education', 'degree', 'grade', 'marry', 'divorce', 'driver',
       'certificate', 'owner', 'deposit', 'qualified', 'translate'].include?(value)
    end
  end

end
