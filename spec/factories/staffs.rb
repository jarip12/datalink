# == Schema Information
#
# Table name: staffs
#
#  id                     :integer          not null, primary key
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  role                   :string(255)
#  realname               :string(255)
#


FactoryGirl.define do
  factory :staff do
    email "staff@gmail.com"
    password "12345678"

    factory :admin do
      role :admin
      email "admin@gmail.com"
    end

    factory :audit do
      role :audit
      email "audit@gmail.com"
    end

    factory :typer do
      role :typer
      email "typer@gmail.com"
    end

    factory :user_staff do
      role :user
      email "user@gmail.com"
    end

  end

end
