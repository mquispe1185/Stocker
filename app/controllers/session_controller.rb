class SessionController < ApplicationController
   before_action :logged_in_user, only: [:new]
  
  def new
    fecha = DateTime.now.strftime  "%Y/%m/%d"
    cierre = Cierre.find_by(usuario_id: @current_user.id, estado: false)
        if cierre.nil?
            puts "entra en NIL"
            
            @nuevo_cierre = Cierre.new(usuario_id: @current_user.id, estado: false,fecha: fecha, negocio_id: @current_user.negocio_id)
               if @nuevo_cierre.save
              
                flash[:success] = 'Bienvenido, la caja esta abierta'
                redirect_to edit_negocio_cierre_path(negocio_id: @current_user.negocio_id, id: @nuevo_cierre.id) 
                else
                  puts @nuevo_cierre.errors.full_messages
                end 
        else
          
            if cierre.monto_inicial.nil?
                redirect_to edit_negocio_cierre_path(negocio_id: @current_user.negocio_id, id:cierre.id)
            else    
            flash[:success] = 'Bienvenido'
            redirect_to new_negocio_venta__path(negocio_id: @current_user.negocio_id)
            end
        end
  end

  def create
    fecha = DateTime.now.strftime  "%Y/%m/%d"
  	 user = Usuario.find_by(usuario: params[:session][:usuario].downcase)
     puts "tenemos el user"
    # cierre = Cierre.find_by(usuario_id: user.id, estado: false)
    if user && user.authenticate(params[:session][:password])
            puts "estamos autenticados"
            log_in user
            horario = Horario.find_by(usuario_id: user.id, cerrado: false)
            if horario.nil?
            horario = Horario.new(usuario_id: user.id, negocio_id: user.negocio.id)
            horario.save
            end
            flash[:success] = 'Bienvenido'
      		redirect_to negocio_usuario_path(negocio_id: user.negocio_id, id: user.id)
      
    else
      # Create an error message.
      flash[:danger] = 'Usuario o contraseña incorrecta'
      redirect_to new_admin_path
    end
  end

  def destroy
  	 horario = current_horario
     horario.update(cerrado: true, final: params[:final], duracion: params[:duracion])
     log_out

     flash[:danger] = 'Adiós!'
    redirect_to root_url
  end

  # def session_params
  #   params.permit[]
  # end
end
