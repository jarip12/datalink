
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
