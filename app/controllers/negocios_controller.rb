class NegociosController < ApplicationController
  before_action :set_negocio, only: [:show, :edit, :update, :destroy]
  before_action :set_admin,only: [:index,:new,:create, :destroy, :update]
  # GET /negocios
  # GET /negocios.json
  def index
    @negocios = @admin.negocios
  end

  # GET /negocios/1
  # GET /negocios/1.json
  def show
    @poco = Producto.where("stock < minimo").where(negocio_id: @negocio.id).count
    @caja_abierta = Cierre.where(estado: false).count
  end

  # GET /negocios/new
  def new
    @negocio = @admin.negocios.new

  end

  # GET /negocios/1/edit
  def edit
  end

  # POST /negocios
  # POST /negocios.json
  def create
   # @admin= Admin.find(params[:negocio][:id])
    @negocio = @admin.negocios.new(negocio_params)

    
      if @negocio.save
        @nueva_caja = Caja.new(nombre: "PRINCIPAL", negocio_id: @negocio.id)
        @nueva_caja.save
        @tipo_pago = TipoPago.new(nombre: "CONTADO", negocio_id: @negocio.id, modificador: 1)
        @tipo_pago.save
        flash[:success] = "Nuevo negocio creado!"
       redirect_to admin_path @admin
    end
  end

  # PATCH/PUT /negocios/1
  # PATCH/PUT /negocios/1.json
  def update
    
      if @negocio.update(negocio_params)
        flash[:success] = "Datos actualizados !"
        redirect_to admin_path @admin
      end
    
  end

  # DELETE /negocios/1
  # DELETE /negocios/1.json
  def destroy
    @negocio.destroy
    flash[:danger] = "Negocio eliminado! :-("
    redirect_to admin_path @admin
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_negocio
      @negocio = Negocio.find(params[:id])
    end

    def set_admin
      @admin = Admin.find(params[:admin_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def negocio_params
      
      params.require(:negocio).permit(:nombre, :direccion, :telefono, :cuit, :alta, :expiracion_licencia, :validado, :admin_id)
    end
end
