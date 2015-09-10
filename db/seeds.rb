
User.create!([
                 {realname: "张学友", email: "dilin.life@gmail.com", password: "12345678", password_confirmation: "12345678"},
{realname: "韩雪", email: "fengjing.life@gmail.com", password: "12345678", password_confirmation: "12345678"}
             ])


Staff.create!([
                 {email: "admin@admin.com", password: "12345678", password_confirmation: "12345678"},
             ])


Reservation.create!([
                   {user_id: 1, notary_type: "forien", reserve_at: Time.now},
                  {user_id: 2, notary_type: "forien", reserve_at: Time.now}
               ])