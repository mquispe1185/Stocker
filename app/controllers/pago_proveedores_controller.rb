class PagoProveedoresController < ApplicationController
  before_action :set_pago_proveedore, only: [:show, :edit, :update, :destroy]
  before_action :set_negocio
  before_action :logged_in_user, only: [:new, :create]
  # GET /pago_proveedores
  # GET /pago_proveedores.json
  def index
    @pago_proveedores = PagoProveedore.where(cuenta_proveedor_id: params[:cuenta_id])
  end

  # GET /pago_proveedores/1
  # GET /pago_proveedores/1.json
  def show
  end

  # GET /pago_proveedores/new
  def new
    @pago_proveedore = PagoProveedore.new
    @pago_proveedore.cuenta_proveedor_id = params[:cuenta_id]
    
    @pagos_de_cuenta = PagoProveedore.where(cuenta_proveedor_id: params[:cuenta_id])
  end

  # GET /pago_proveedores/1/edit
  def edit
  end

  # POST /pago_proveedores
  # POST /pago_proveedores.json
  def create
    @pago_proveedore = PagoProveedore.new(pago_proveedore_params)
      @pago_proveedore.usuario_id = @current_user.id
      if @pago_proveedore.save
        CuentaProveedorsController.update(@pago_proveedore)
        flash[:success] = 'Saldo de cuenta actualizado.'
         redirect_to new_negocio_cuenta_proveedor_url
      else
        puts @pago_proveedore.errors.full_messages
    end
  end

  # PATCH/PUT /pago_proveedores/1
  # PATCH/PUT /pago_proveedores/1.json
  def update
    respond_to do |format|
      if @pago_proveedore.update(pago_proveedore_params)
        format.html { redirect_to @pago_proveedore, notice: 'Pago proveedore was successfully updated.' }
        format.json { render :show, status: :ok, location: @pago_proveedore }
      else
        format.html { render :edit }
        format.json { render json: @pago_proveedore.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pago_proveedores/1
  # DELETE /pago_proveedores/1.json
  def destroy
    @pago_proveedore.destroy
    respond_to do |format|
      format.html { redirect_to pago_proveedores_url, notice: 'Pago proveedore was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pago_proveedore
      @pago_proveedore = PagoProveedore.find(params[:id])
    end

     def set_negocio
      @negocio = Negocio.find(params[:negocio_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pago_proveedore_params
      params.require(:pago_proveedore).permit(:cuenta_proveedor_id, :monto, :usuario_id, :observacion)
    end
end
