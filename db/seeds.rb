

400.times do |n|
  id_no = "421081#{Faker::Number.number(12)}"
  User.create!(id_no: id_no, realname: Faker::Name.name, email: "demo#{n}@gmail.com", password: "12345678", password_confirmation: "12345678")
end


Staff.create!([
                 {role: "admin", email: "admin@admin.com", password: "12345678", password_confirmation: "12345678"},
             ])



400.times do
  offset = Faker::Number.between(-5, 5).days + Faker::Number.between(-30, 30).minutes + Faker::Number.between(-12, 12).hours
  Reservation.create!(user_id: Faker::Number.between(1, User.last.id), reserve_at: Time.now + offset)
end

