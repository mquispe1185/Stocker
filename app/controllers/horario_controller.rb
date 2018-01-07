class HorarioController < ApplicationController
   before_action :set_negocio
  def index
  	@horarios = @negocio.horarios
  end

  def buscar_horarios
  	  start_date = params[:horario][:fecha_inicio].to_date.beginning_of_day
    end_date = params[:horario][:fecha_final].to_date.end_of_day
    @horarios = @negocio.horarios.where(:created_at => start_date..end_date)
    
      respond_to do |format|
        format.html {render :index}
        format.js
        end
  end
   private
    # Use callbacks to share common setup or constraints between actions.
    

     def set_negocio
      @negocio = Negocio.find(params[:negocio_id])
    end
end
