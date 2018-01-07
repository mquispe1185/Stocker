class GastosController < ApplicationController
  before_action :set_gasto, only: [:show, :edit, :update, :destroy]
  before_action :set_negocio
  before_action :logged_in_user, only: [:new,:create,:edit,:destroy]
  # GET /gastos
  # GET /gastos.json
  def index
     fecha = DateTime.now.strftime  "%Y/%m/%d"
    @gastos = @negocio.gastos.where(created_at: fecha)
  end
  def buscar_gastos
    start_date = params[:fechagastos][:fecha_inicio].to_date.beginning_of_day
    end_date = params[:fechagastos][:fecha_final].to_date.end_of_day
    @gastos = @negocio.gastos.where(:created_at => start_date..end_date)
    
      respond_to do |format|
        format.html {render :index}
        format.js
        end
    
  end

  # GET /gastos/1
  # GET /gastos/1.json
  def show
  end

  # GET /gastos/new
  def new
    @gastos_usuario = Gasto.where(usuario_id: @current_user.id).where(rendido: false)
    @gasto = Gasto.new
    puts "buscamos los gastos del usuario"
    @gastos_usuario.each do |g|
    puts g.descripcion
    end
    #  @gasto_usuario.errors.each do |err|
    
    # puts err.full_messages
    # end
    puts "pasamos por aquii en GastosController"
  end

  # GET /gastos/1/edit
  def edit
  end

  # POST /gastos
  # POST /gastos.json
  def create
    @gasto = Gasto.new(gasto_params)
    @gasto.negocio_id = @negocio.id
    @gasto.cierre_id = current_cierre.id
    @gasto.rendido = false
     @gastos_usuario = Gasto.where(usuario_id: @current_user.id).where(rendido: false)
  
      if @gasto.save
       # puts @gasto_usuario
        #redirect_to new_negocio_gasto_url
         respond_to do |format|
        format.html {render :new}
        format.js
        end
      else
        puts @gasto.errors.full_messages
     
      end
  
  end

  # PATCH/PUT /gastos/1
  # PATCH/PUT /gastos/1.json
  def update
    respond_to do |format|
      if @gasto.update(gasto_params)
        format.html { redirect_to @gasto, notice: 'Gasto was successfully updated.' }
        format.json { render :show, status: :ok, location: @gasto }
      else
        format.html { render :edit }
        format.json { render json: @gasto.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /gastos/1
  # DELETE /gastos/1.json
  def destroy
    @gasto.destroy
    @gastos_usuario = Gasto.where(usuario_id: @current_user.id).where(rendido: false)
     respond_to do |format|
        format.html {render :new}
        format.js
        end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_gasto
      @gasto = Gasto.find(params[:id])
    end

     def set_negocio
      @negocio = Negocio.find(params[:negocio_id])
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def gasto_params
      params.permit(:fecha_inicio, :fecha_final)
      params.require(:gasto).permit(:descripcion, :categoria_id, :usuario_id, :negocio_id, :monto,:fecha_inicio, :fecha_final, :cierre_id)
    end
end
