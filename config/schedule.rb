#whenever > crontabfile
#rails runner "Reservation.verified_in_user_system"
#rails runner "NotaryRecord.push_to_user_system"
#rails runner "FamilyRelation.sync_to_user_system"

every 1.minutes do
  runner "NotaryRecord.push_to_user_system"
  runner "Reservation.verified_in_user_system"
  runner "FamilyRelation.sync_to_user_system"
end
