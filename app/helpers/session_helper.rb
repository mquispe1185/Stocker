module SessionHelper
  def log_in(user)
    session[:usuario_id] = user.id
  end

  def current_user
    @current_user ||= Usuario.find_by(id: session[:usuario_id])
  end

   def logged_in?
    !current_user.nil?
    
  end



  def log_out
    session.delete(:usuario_id)
  
    @current_user = nil

  end

  def current_cierre
    user = current_user
    @current_cierre ||= Cierre.find_by(usuario_id: user.id, estado: false)
  end

  def current_horario
    user = current_user
    @current_horario ||= Horario.find_by(usuario_id: user.id, cerrado: false)
  end
end
