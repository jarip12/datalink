
FactoryGirl.define do
  factory :staff do
    email "staff@gmail.com"
    password "12345678"

    factory :admin do
      role :admin
      email "admin@gmail.com"
    end

  end

end
