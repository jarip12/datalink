# == Schema Information
#
# Table name: settings
#
#  id         :integer          not null, primary key
#  var        :string(255)      not null
#  value      :text(65535)
#  thing_id   :integer
#  thing_type :string(30)
#  created_at :datetime
#  updated_at :datetime
#

class Setting < RailsSettings::CachedSettings
  defaults[:mobile_regex_format] = '^1[3|4|5|8][0-9]\\d{8}$'
  defaults[:real_name_regex_format] = '^[\u4E00-\u9FA5]{2,4}$'
  defaults[:id_no_regex_format] = '^[0-9xX]{15, 18}$'
  defaults[:notary_record_user_system_api] = 'http://127.0.0.1:3002/api/v1/notary_records.json'
  defaults[:set_user_verified_url] = 'http://127.0.0.1:3002/api/v1/user_verify.json'
end
