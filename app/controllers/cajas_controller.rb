class CajasController < ApplicationController
  before_action :set_caja, only: [:show, :edit, :update, :destroy]
  before_action :set_negocio
  # GET /cajas
  # GET /cajas.json
  def index
    @cajas = Caja.all
  end

  # GET /cajas/1
  # GET /cajas/1.json
  def show
  end

  # GET /cajas/new
  def new
    @caja = Caja.new
    @cajas = @negocio.cajas
  end

  # GET /cajas/1/edit
  def edit
  end

  # POST /cajas
  # POST /cajas.json
  def create
    @caja = Caja.new(caja_params)
    @cajas = @negocio.cajas
    respond_to do |format|
      if @caja.save
       
        format.html { render :new }
        format.js { flash[:success] ='Caja creada!'}
      end
    end
  end

  # PATCH/PUT /cajas/1
  # PATCH/PUT /cajas/1.json
  def update
    
      if @caja.update(caja_params)
        redirect_to new_negocio_caja_url
    
    end
  end

  # DELETE /cajas/1
  # DELETE /cajas/1.json
  def destroy
    @caja.destroy
    @cajas = @negocio.cajas
   
    respond_to do |format|
     
        format.html { render :new }
        format.js { flash[:danger] = 'Caja eliminada!' }
      end
  
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_caja
      @caja = Caja.find(params[:id])
    end

     def set_negocio
      @negocio = Negocio.find(params[:negocio_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def caja_params
      params.require(:caja).permit(:nombre, :negocio_id)
    end
end
