class CuentaClientesController < ApplicationController
  before_action :set_cuenta_cliente, only: [:show, :edit, :update, :destroy]
  before_action :set_negocio
  # GET /cuenta_clientes
  # GET /cuenta_clientes.json
  def index
    @cuenta_clientes = @negocio.cuenta_clientes
  end

  # GET /cuenta_clientes/1
  # GET /cuenta_clientes/1.json
  def show
  end

  # GET /cuenta_clientes/new
  def new
    @cuenta_cliente = CuentaCliente.new
    @cuenta_clientes = CuentaCliente.where(negocio_id: @negocio.id)
  end

  # GET /cuenta_clientes/1/edit
  def edit
  end

  # POST /cuenta_clientes
  # POST /cuenta_clientes.json
  def create
    @cuenta_cliente = CuentaCliente.new(cuenta_cliente_params)
    @cuenta_clientes = @negocio.cuenta_clientes
 
      if @cuenta_cliente.save
          respond_to do |format|
        format.html {render :new}
        format.js
        end
    end
  end

  # PATCH/PUT /cuenta_clientes/1
  # PATCH/PUT /cuenta_clientes/1.json
  def self.update(detalle)
      @cuenta_cliente = CuentaCliente.find(detalle.cuenta_cliente_id)
      nuevo_monto = @cuenta_cliente.monto_adeudado + detalle.monto
      @cuenta_cliente.update(monto_adeudado: nuevo_monto)
   
  end

  def self.updatepago(pago)
      @cuenta_cliente = CuentaCliente.find(pago.cuenta_cliente_id)
      nuevo_monto = @cuenta_cliente.monto_adeudado - pago.monto
      @cuenta_cliente.update(monto_adeudado: nuevo_monto)
   
  end
  # DELETE /cuenta_clientes/1
  # DELETE /cuenta_clientes/1.json
  def destroy
    @cuenta_clientes = @negocio.cuenta_clientes
    @cuenta_cliente.destroy
      respond_to do |format|
        format.html {render :new}
        format.js
        end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cuenta_cliente
      @cuenta_cliente = CuentaCliente.find(params[:id])
    end

      def set_negocio
      @negocio = Negocio.find(params[:negocio_id])
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def cuenta_cliente_params
      params.require(:cuenta_cliente).permit(:cliente_id, :monto_adeudado, :observacion, :negocio_id)
    end
end
