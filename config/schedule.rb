#whenever > crontabfile

every 1.minutes do
  runner "NotaryRecord.push_to_user_system"
end
