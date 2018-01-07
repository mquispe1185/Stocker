class DetalleVentasController < ApplicationController
  before_action :set_detalle_venta, only: [:show, :edit, :update, :destroy]
  before_action :set_venta
  # GET /detalle_ventas
  # GET /detalle_ventas.json
  def index
    @detalle_ventas = @ventas.detalle_ventas.all
  end

  # GET /detalle_ventas/1
  # GET /detalle_ventas/1.json
  def show
  end

  # GET /detalle_ventas/new
  def new
    @detalle_venta = DetalleVenta.new
  end

  # GET /detalle_ventas/1/edit
  def edit
  end

  # POST /detalle_ventas
  # POST /detalle_ventas.json
  def self.create(detalle, venta_id)
    prod = Producto.find(detalle[:id])
    detalle_cantidad = detalle[:cantidad]
    nuevostock = prod.stock - detalle_cantidad.to_f
    prod.update(stock: nuevostock)
    @venta_detalle = DetalleVenta.new(producto_id: detalle[:id], cantidad: detalle_cantidad, subtotal: detalle[:importe].to_f, venta_id: venta_id)
    @venta_detalle.save
  end

  # PATCH/PUT /detalle_ventas/1
  # PATCH/PUT /detalle_ventas/1.json
  def update
    respond_to do |format|
      if @detalle_venta.update(detalle_venta_params)
        format.html { redirect_to @detalle_venta, notice: 'Detalle venta was successfully updated.' }
        format.json { render :show, status: :ok, location: @detalle_venta }
      else
        format.html { render :edit }
        format.json { render json: @detalle_venta.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /detalle_ventas/1
  # DELETE /detalle_ventas/1.json
  def destroy
    @detalle_venta.destroy
    respond_to do |format|
      format.html { redirect_to detalle_ventas_url, notice: 'Detalle venta was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_detalle_venta
      @detalle_venta = DetalleVenta.find(params[:id])
    end

    def set_venta
      
      @ventas = Venta.find(params[:venta_id])
      @negocio = Negocio.find(params[:negocio_id])
    end

    def set_negocio

    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def detalle_venta_params
      params.require(:detalle_venta).permit(:producto_id, :cantidad, :modificador, :subtotal, :venta_id)
    end
end
