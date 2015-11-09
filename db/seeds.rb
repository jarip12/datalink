if User.count == 0

  400.times do |n|
    id_no = "421081#{Faker::Number.number(12)}"
    User.create!(id_no: id_no, realname: Faker::Name.name, email: "demo#{n}@gmail.com", password: "12345678", password_confirmation: "12345678")
  end


  Staff.create!([
                    {realname: "管理员", role: "admin", email: "admin@gmail.com", password: "12345678", password_confirmation: "12345678"},
                    {realname: "使用者", role: "user", email: "user@gmail.com", password: "12345678", password_confirmation: "12345678"},
                    {realname: "审批人", role: "audit", email: "audit@gmail.com", password: "12345678", password_confirmation: "12345678"},
                    {realname: "录入人", role: "typer", email: "typer@gmail.com", password: "12345678", password_confirmation: "12345678"},
                ])

  100.times do |n|
    id_no = "421081#{Faker::Number.number(12)}"
    Profile.create(realname: Faker::Name.name, id_no: id_no, archive_id: n + 1)
    archive = Archive.create

    FamilyRelation.where(relation_name: "father", family_related_id: archive.family_related_id).update_all(:realname => "父亲大人")

    family_relation = FamilyRelation.new(realname: "母亲大人", relation_name: "mother", family_related_id: archive.family_related_id)
    family_relation.save(:validate => false)

    family_relation = FamilyRelation.new(realname: "哥哥", relation_name: "old_brother", family_related_id: archive.family_related_id)
    family_relation.save(:validate => false)

    family_relation = FamilyRelation.new(realname: "弟弟", relation_name: "young_brother", family_related_id: archive.family_related_id)
    family_relation.save(:validate => false)

    family_relation = FamilyRelation.new(realname: "儿子", relation_name: "son", family_related_id: archive.family_related_id)
    family_relation.save(:validate => false)

    family_relation = FamilyRelation.new(realname: "女儿", relation_name: "daughter", family_related_id: archive.family_related_id)
    family_relation.save(:validate => false)

    family_relation = FamilyRelation.new(realname: "配偶", relation_name: "spouse", family_related_id: archive.family_related_id)
    family_relation.save(:validate => false)
  end

=begin
  400.times do
    offset = Faker::Number.between(-5, 5).days + Faker::Number.between(-30, 30).minutes + Faker::Number.between(-12, 12).hours
    Reservation.create!(user_id: Faker::Number.between(1, User.last.id), reserve_at: Time.now + offset)
  end
=end

end
