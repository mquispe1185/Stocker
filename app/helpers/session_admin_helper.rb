module SessionAdminHelper
  def login_admin(admin)
    session[:admin_id] = admin.id
  end

  def current_admin
    @current_admin ||= Admin.find_by(id: session[:admin_id])
  end

   def logged_in_admin?
    !current_admin.nil?
  end

  def log_out_admin
    session.delete(:admin_id)
    @current_admin = nil
  end

 
end
