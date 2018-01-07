class CuentaProveedorsController < ApplicationController
  before_action :set_cuenta_proveedor, only: [:show, :edit, :update, :destroy]
  before_action :set_negocio
  # GET /cuenta_proveedores
  # GET /cuenta_proveedores.json
  def index
    @cuenta_proveedores = @negocio.cuenta_proveedors
  end

  # GET /cuenta_proveedores/1
  # GET /cuenta_proveedores/1.json
  def show
  end

  # GET /cuenta_proveedores/new
  def new
    @cuenta_proveedor = CuentaProveedor.new
    @cuentas = @negocio.cuenta_proveedors
  end

  # GET /cuenta_proveedores/1/edit
  def edit
  end

  # POST /cuenta_proveedores
  # POST /cuenta_proveedores.json
  def create
    @cuenta_proveedor = CuentaProveedor.new(cuenta_proveedor_params)
    @cuenta_proveedor.negocio_id = @negocio.id
    @cuentas = @negocio.cuenta_proveedors

    
      if @cuenta_proveedor.save
         respond_to do |format|
        format.html {render :new}
        format.js
        end
      end
 
  end

  # PATCH/PUT /cuenta_proveedores/1
  # PATCH/PUT /cuenta_proveedores/1.json
  def self.update(nuevo)
      @cuenta_proveedor = CuentaProveedor.find(nuevo.cuenta_proveedor_id)
      monto = @cuenta_proveedor.monto_adeudado
      actualizado = monto - nuevo.monto
      @cuenta_proveedor.update(monto_adeudado: actualizado)
     
     puts "ACTUALIZACION EXITOSA" 
    
  end

  # DELETE /cuenta_proveedores/1
  # DELETE /cuenta_proveedores/1.json
  def destroy
    @cuenta_proveedor.destroy
    respond_to do |format|
      format.html { redirect_to cuenta_proveedores_url, notice: 'Cuenta proveedor was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cuenta_proveedor
      @cuenta_proveedor = CuentaProveedor.find(params[:id])
    end

      def set_negocio
      @negocio = Negocio.find(params[:negocio_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cuenta_proveedor_params
      params.require(:cuenta_proveedor).permit(:proveedor_id, :negocio_id, :monto_adeudado, :observacion)
    end
end
