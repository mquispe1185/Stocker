class DetalleClientesController < ApplicationController
  before_action :set_detalle_cliente, only: [:show, :edit, :update, :destroy]
  before_action :set_negocio
  before_action :logged_in_user, only: [:new,:create,:edit]
  # GET /detalle_clientes
  # GET /detalle_clientes.json
  def index
    @detalle_clientes = @cuenta.detalle_clientes
    @pagos = @cuenta.pago_clientes
  end

  # GET /detalle_clientes/1
  # GET /detalle_clientes/1.json
  def show
  end

  # GET /detalle_clientes/new
  def new
    @detalle_cliente = DetalleCliente.new
    @detalle_clientes = DetalleCliente.where(cuenta_cliente_id: @cuenta.id)
  end

  # GET /detalle_clientes/1/edit
  def edit
  end

  # POST /detalle_clientes
  # POST /detalle_clientes.json
  def create
    @detalle_cliente = DetalleCliente.new(detalle_cliente_params)
    @detalle_clientes = @cuenta.detalle_clientes
 
      if @detalle_cliente.save
        CuentaClientesController.update(@detalle_cliente)
        respond_to do |format|
        format.html {render :index}
        format.js
        end
     
    end
  end

  # PATCH/PUT /detalle_clientes/1
  # PATCH/PUT /detalle_clientes/1.json
  def update
    respond_to do |format|
      if @detalle_cliente.update(detalle_cliente_params)
        format.html { redirect_to @detalle_cliente, notice: 'Detalle cliente was successfully updated.' }
        format.json { render :show, status: :ok, location: @detalle_cliente }
      else
        format.html { render :edit }
        format.json { render json: @detalle_cliente.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /detalle_clientes/1
  # DELETE /detalle_clientes/1.json
  def destroy
    @detalle_cliente.destroy
    respond_to do |format|
      format.html { redirect_to detalle_clientes_url, notice: 'Detalle cliente was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_detalle_cliente
      @detalle_cliente = DetalleCliente.find(params[:id])
    end


     def set_negocio
      @negocio = Negocio.find(params[:negocio_id])
      @cuenta = CuentaCliente.find(params[:cuenta_cliente_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def detalle_cliente_params
      params.require(:detalle_cliente).permit(:cuenta_cliente_id, :usuario_id, :detalle, :monto)
    end
end
