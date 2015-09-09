
User.create!([
                 {email: "admin@admin.com", password: "12345678", password_confirmation: "12345678"},
                 {email: "dilin.life@gmail.com", password: "12345678", password_confirmation: "12345678"}
             ])

Reservation.create!([
                   {name: "李浩", notary_type: "forien", reserve_at: Time.now},
                  {name: "王菲", notary_type: "forien", reserve_at: Time.now}
               ])