class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionAdminHelper
  include SessionHelper
  include DetalleVentasHelper
  def logged_in_admin
      unless logged_in_admin?
        flash[:danger] = "Acceso denegado. Debe loguearse!"
        redirect_to new_admin_path
      end
    end

  def logged_in_user
      unless logged_in?
        flash[:danger] = "Acceso denegado. Debe loguearse!"
        redirect_to login_url
      end
    end

 
end
