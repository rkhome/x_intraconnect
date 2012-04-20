module ApplicationHelper
  def is_admin?
   (current_user.login_role == 'admin') ? true : false
  end

  def nav
    case current_user.login_role.downcase
    when "admin"
      'layouts/nav_admin'
    when "employee"
      'layouts/nav_employee'
    else
      'layouts/nav'
    end
  end
end
