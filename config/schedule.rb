#whenever > crontabfile

every 1.minutes do
  runner "NotaryRecord.push_to_user_system"
  runner "Reservation.verified_in_user_system"
  runner "FamilyRelation.sync_to_user_system"
end
