if Staff.count == 0

  Staff.create!([
                    {realname: "管理员", role: "admin", email: "lwgzc@lwnotary.gov.cn", password: "12345678", password_confirmation: "12345678"},
                ])

end
