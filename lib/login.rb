
class Login
  def self.current_staff(session)
    ap session
    staff = Staff.find(session["warden.user.staff.key"][0][0])
    if staff
      staff.admin?
    end
  end
end