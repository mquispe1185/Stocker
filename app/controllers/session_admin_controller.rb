class SessionAdminController < ApplicationController
  def new

  end

  def create
  	 admin = Admin.find_by(usuario: params[:admin][:usuario].downcase)
    if admin && admin.authenticate(params[:admin][:password])
            login_admin admin
            flash[:success] = 'Bienvenido'
      		redirect_to admin_path admin

    else
      # Create an error message.
      flash[:danger] = 'Usuario o contraseña incorrecta'
      redirect_to new_admin_path
    end
  end

  def destroy
  	 log_out_admin
     flash[:danger] = 'Adiós!'
    redirect_to root_url
  end
end
