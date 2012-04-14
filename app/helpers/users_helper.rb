module UsersHelper
  def is_admin?
   (current_user.login_role.to_s.downcase == 'admin') ? true : false
  end
end
