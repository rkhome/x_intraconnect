module ApplicationHelper
  def is_admin?
   (current_user.login_role == 'admin') ? true : false
  end

  def nav
      return 'layouts/nav' if current_user.nil?
    case current_user.login_role.downcase
    when "admin"
      'layouts/nav_admin'
    when "employee"
      'layouts/nav_employee'    
    end
  end
end
