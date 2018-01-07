class PagoClientesController < ApplicationController
  before_action :set_pago_cliente, only: [:show, :edit, :update, :destroy]
   before_action :set_negocio
  before_action :logged_in_user, only: [:new,:create,:edit]
  # GET /pago_clientes
  # GET /pago_clientes.json
  def index
    @pago_clientes = PagoCliente.all
  end

  # GET /pago_clientes/1
  # GET /pago_clientes/1.json
  def show
  end

  # GET /pago_clientes/new
  def new
    @pago_cliente = PagoCliente.new
    @pago_clientes = PagoCliente.where(cuenta_cliente_id: @cuenta.id)
  end

  # GET /pago_clientes/1/edit
  def edit
  end

  # POST /pago_clientes
  # POST /pago_clientes.json
  def create
    @pago_cliente = PagoCliente.new(pago_cliente_params)

    
      if @pago_cliente.save
        CuentaClientesController.updatepago(@pago_cliente)
        flash[:success] = 'Pago guardado!'
      redirect_to new_negocio_cuenta_cliente_url 
  
    end
  end

  # PATCH/PUT /pago_clientes/1
  # PATCH/PUT /pago_clientes/1.json
  def update
    respond_to do |format|
      if @pago_cliente.update(pago_cliente_params)
        format.html { redirect_to @pago_cliente, notice: 'Pago cliente was successfully updated.' }
        format.json { render :show, status: :ok, location: @pago_cliente }
      else
        format.html { render :edit }
        format.json { render json: @pago_cliente.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pago_clientes/1
  # DELETE /pago_clientes/1.json
  def destroy
    @pago_cliente.destroy
    respond_to do |format|
      format.html { redirect_to pago_clientes_url, notice: 'Pago cliente was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pago_cliente
      @pago_cliente = PagoCliente.find(params[:id])
    end

     def set_negocio
      @negocio = Negocio.find(params[:negocio_id])
      @cuenta = CuentaCliente.find(params[:cuenta_cliente_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pago_cliente_params
      params.require(:pago_cliente).permit(:cuenta_cliente_id, :monto, :usuario_id, :observacion)
    end
end
