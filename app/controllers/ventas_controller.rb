class VentasController < ApplicationController
  before_action :logged_in_user, only: [:create, :ventas_usuario, :filtrar_caja] 
  before_action :set_venta, only: [:show, :edit, :update, :destroy]
  before_action :set_negocio, except: [:create]
  autocomplete :producto, :descripcion, :full => true,:extra_data => [:precio]
  # GET /ventas
  # GET /ventas.json
  def index
    fecha = DateTime.now.strftime  "%Y/%m/%d"
    @ventas = @negocio.ventas.where(fecha: fecha)
  end

  def historico_ventas
    fecha = DateTime.now.strftime  "%Y/%m/%d"
    @ventas_historico = @negocio.ventas.where(fecha: fecha)
    render 'historico_ventas'

  end

  def buscar_ventas
       start_date = params[:ventas][:fecha_inicio].to_date.beginning_of_day
      end_date = params[:ventas][:fecha_final].to_date.end_of_day
      @ventas_historico = @negocio.ventas.where(:fecha => start_date..end_date)
    respond_to do |format|
        format.html {render :historico_ventas}
        format.js
        end
    
  end

  def autocomplete_producto_descripcion
   # @patron= params[:nombre]
    @productos = Producto.select("*, codigo || '-' || descripcion as rep").where("descripcion ILIKE CONCAT('%',?,'%')",params[:term]).or(Producto.select("*, codigo || '-' || descripcion as rep").where("codigo ILIKE CONCAT('%',?,'%')",params[:term])).where(negocio_id: @negocio.id)
    render json: @productos.map { |product| {:id => product.id, :label => product.rep, :value => product.rep, :precio => product.precio} }
  end

  # GET /ventas/1
  # GET /ventas/1.json
  def show
  end

  # GET /ventas/new
  def new
    @venta = @negocio.ventas.new
    @tipo_pago = TipoPago.where(negocio_id: @negocio.id)
  end

  # GET /ventas/1/edit
  def edit
  end

  # POST /ventas
  # POST /ventas.json
  def create
    puts "estamos aquiii"
    @venta = Venta.new(total: params[:total],caja_id: params[:caja_id], tipo_pago_id: params[:tipo_pago])
     @venta.fecha =DateTime.now.strftime  "%Y/%m/%d"
     puts "definimos fecha"
     @venta.cierre_id = current_cierre.id
     @venta.usuario_id = @current_user.id
     @venta.negocio_id = params[:negocio_id]
     @venta.estado = false
     puts "ya le cargamos el usuario_id"
     if @venta.save
      flash[:success] = "Venta guardada"
      @venta.update(ticket: 100+@venta.id)
     puts "GUARDADOOO"+@venta.id.to_s
    
      @details= params[:detalles]
      puts "cargamos los detalles en variable"
      @details.each { |x| 

         puts @details["#{x}"]
        DetalleVentasController.create(@details["#{x}"],@venta.id)
         }
      else
        puts @venta.errors.full_messages
      end
  end

  # PATCH/PUT /ventas/1
  # PATCH/PUT /ventas/1.json
  def update
    respond_to do |format|
      if @venta.update(venta_params)
        format.html { redirect_to @venta, notice: 'Venta was successfully updated.' }
        format.json { render :show, status: :ok, location: @venta }
      else
        format.html { render :edit }
        format.json { render json: @venta.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ventas/1
  # DELETE /ventas/1.json
  def destroy
    @venta.destroy
    respond_to do |format|
      format.html { redirect_to ventas_url, notice: 'Venta was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

   def ventas_usuario
    fecha = DateTime.now.strftime  "%Y/%m/%d"
    @ventas = @negocio.ventas.where(fecha: fecha).where(usuario_id: @current_user.id)
    render 'ventas_usuario'
  end

  def filtrar_caja
    fecha = DateTime.now.strftime  "%Y/%m/%d"
    if params[:caja][:caja_id].empty?
      
      @ventas = @negocio.ventas.where(fecha: fecha).where(usuario_id: @current_user.id)
    else  
    @ventas = @negocio.ventas.where(fecha: fecha).where(usuario_id: @current_user.id).where(caja_id: params[:caja][:caja_id])
    
    respond_to do |format|
     
        format.html { render :ventas_usuario }
        format.js
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_venta
      @venta = Venta.find(params[:id])
    end

     def set_negocio
      @negocio = Negocio.find(params[:negocio_id])
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def venta_params
      params.require(:venta).permit(:ticket, :usuario_id, :fecha, :total,:caja_id,:tipo_pago_id)
    end
end
