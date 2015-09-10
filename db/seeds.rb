
User.create!([
                 {realname: "张学友", email: "dilin.life@gmail.com", password: "12345678", password_confirmation: "12345678"},
{realname: "王菲", email: "fengjing.life2@gmail.com", password: "12345678", password_confirmation: "12345678"},
{realname: "刘德华", email: "fengjing.life3@gmail.com", password: "12345678", password_confirmation: "12345678"},
{realname: "李四", email: "fengjing.life4@gmail.com", password: "12345678", password_confirmation: "12345678"},
{realname: "王麻子", email: "fengjing.life5@gmail.com", password: "12345678", password_confirmation: "12345678"},
{realname: "刘瘸子", email: "fengjing.life6@gmail.com", password: "12345678", password_confirmation: "12345678"},
             ])

400.times do |n|
  User.create!(realname: Faker::Name.name, email: "demo#{n}@gmail.com", password: "12345678", password_confirmation: "12345678")
end


Staff.create!([
                 {email: "admin@admin.com", password: "12345678", password_confirmation: "12345678"},
             ])



400.times do
  offset = Faker::Number.between(-5, 5).days + Faker::Number.between(-30, 30).minutes + Faker::Number.between(-12, 12).hours
  Reservation.create!(user_id: Faker::Number.between(1, User.last.id), reserve_at: Time.now + offset)
end

