

400.times do |n|
  id_no = "421081#{Faker::Number.number(12)}"
  User.create!(id_no: id_no, realname: Faker::Name.name, email: "demo#{n}@gmail.com", password: "12345678", password_confirmation: "12345678")
end


Staff.create!([
                 {role: "admin", email: "admin@gmail.com", password: "12345678", password_confirmation: "12345678"},
                 {role: "user", email: "user@gmail.com", password: "12345678", password_confirmation: "12345678"},
                 {role: "audit", email: "audit@gmail.com", password: "12345678", password_confirmation: "12345678"},
                 {role: "typer", email: "typer@gmail.com", password: "12345678", password_confirmation: "12345678"},
             ])

100.times do |n|
  id_no = "421081#{Faker::Number.number(12)}"
  Profile.create(realname: Faker::Name.name, id_no: id_no, archive_id: n + 1)
  Archive.create
end


400.times do
  offset = Faker::Number.between(-5, 5).days + Faker::Number.between(-30, 30).minutes + Faker::Number.between(-12, 12).hours
  Reservation.create!(user_id: Faker::Number.between(1, User.last.id), reserve_at: Time.now + offset)
end

