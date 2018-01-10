class CierresController < ApplicationController
  before_action :set_cierre, only: [:show, :edit, :update, :destroy, :realizar_cierre]
  before_action :set_negocio
  before_action :logged_in_user, only: [:cierre_caja_usuario, :realizar_cierre]
 
  # GET /cierres
  # GET /cierres.json
  def index
    fecha = DateTime.now.strftime  "%Y/%m/%d"
    @cierres = @negocio.cierres.where(fecha: fecha)
  end


  def historico_cierres
    fecha = DateTime.now.strftime  "%Y/%m/%d"
    @cierres_historicos = @negocio.cierres.where(fecha: fecha)

    render 'historico_cierres'

    
  end

  def buscar_cierres
    start_date = params[:fechas][:fecha_inicio].to_date.beginning_of_day
    end_date = params[:fechas][:fecha_final].to_date.end_of_day
    @cierres_historicos = @negocio.cierres.where(:fecha => start_date..end_date)
    respond_to do |format|
        format.html {render :historico_cierres}
        format.js
        end

    
  end
  # GET /cierres/1
  # GET /cierres/1.json
  def show
  end

  # GET /cierres/new
  def new
    @cierre = Cierre.new
  end

  # GET /cierres/1/edit
  def edit
  end

  # POST /cierres
  # POST /cierres.json
  def create
    @cierre = Cierre.new(cierre_params)

    respond_to do |format|
      if @cierre.save
        format.html { redirect_to @cierre, notice: 'Cierre was successfully created.' }
        format.json { render :show, status: :created, location: @cierre }
      else
        format.html { render :new }
        format.json { render json: @cierre.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cierres/1
  # PATCH/PUT /cierres/1.json

  #APERTURA DE CAJA
  def update
    respond_to do |format|
      t = Time.now
      t.strftime('%H:%M')
      if @cierre.update(hora_inicial: t, monto_inicial: params[:cierre][:monto_inicial], observacion: params[:cierre][:observacion])
        flash[:success] = 'Caja abierta exitosamente'
        format.html { redirect_to new_negocio_venta_url(@negocio) }
        format.json { render :show, status: :ok, location: @cierre }
      else
        format.html { render :edit }
        format.json { render json: @cierre.errors, status: :unprocessable_entity }
      end
    end
  end

  def cierre_caja_usuario
  
    @cierre = Cierre.find_by(usuario_id: @current_user.id,estado: false)
  
    @total_caja = Venta.where(usuario_id: @current_user.id).where(estado: false).sum(:total)
    @total_gastos = Gasto.where(usuario_id: @current_user.id).where(rendido: false).sum(:monto)
    @total_clientes = PagoCliente.where(usuario_id: @current_user.id).where(rendido: false).sum(:monto)
    @total_proveedores = PagoProveedore.where(usuario_id: @current_user.id).where(rendido: false).sum(:monto)
    if !@cierre.nil?
    @neto = @cierre.monto_inicial + @total_caja + @total_clientes- @total_gastos- @total_proveedores
    render 'cierre_caja_usuario'
    else
      flash[:danger] = 'Debe Abrir una caja!'
      redirect_to new_negocio_venta_url
    end
  end

  def realizar_cierre
      t = Time.now
      t.strftime('%H:%M')
      ventas_estado = Venta.where(usuario_id: @current_user.id).where(estado: false)
      gastos_estado = Gasto.where(usuario_id: @current_user.id).where(rendido: false)
      pago_cliente_rendido = PagoCliente.where(usuario_id: @current_user.id).where(rendido: false)
      pago_proveedores_rendido = PagoProveedore.where(usuario_id: @current_user.id).where(rendido: false)

      ventas_estado.each do |v|
        v.update(estado: true)
      end
      gastos_estado.each do |g|
        g.update(rendido: true)
      end

      pago_cliente_rendido.each do |g|
        g.update(rendido: true)
      end

      pago_proveedores_rendido.each do |g|
        g.update(rendido: true)
      end
      puts @cierre
      puts "pasamos por aqui"
      DetalleCierresController.create(@cierre.id,"Monto Inicial",@cierre.monto_inicial)
      DetalleCierresController.create(@cierre.id,"Ventas",ventas_estado.sum(&:total))
      DetalleCierresController.create(@cierre.id,"Gastos",gastos_estado.sum(&:monto))
      DetalleCierresController.create(@cierre.id,"Pago de clientes",pago_cliente_rendido.sum(&:monto))
      DetalleCierresController.create(@cierre.id,"Pago a proveedores",pago_proveedores_rendido.sum(&:monto))


     if @cierre.update(hora_final: t, monto_final: params[:neto], estado: true)
        puts "actualizamos hora final de cierre"
        flash[:success] = 'Caja cerrada exitosamente'
        redirect_to new_negocio_venta_url(@negocio)    
      end
  end

  def balances
    render 'balances'
  end

  def buscar_balance
    start_date = params[:balance][:fecha_inicio].to_date.beginning_of_day
    end_date = params[:balance][:fecha_final].to_date.end_of_day
    @ventas = Venta.where(negocio_id: @negocio.id).where(estado: true).where(:fecha => start_date..end_date).sum(:total)
    @gastos = Gasto.where(negocio_id: @negocio.id).where(rendido: true).where(:created_at => start_date..end_date).sum(:monto)
    @clientes = PagoCliente.joins(cuenta_cliente: :negocio).where(negocios: {id: @negocio.id}).where(rendido: true).where(:created_at => start_date..end_date).sum(:monto)
    @proveedores = PagoProveedore.joins(cuenta_proveedor: :negocio).where(negocios: {id: @negocio.id}).where(rendido: true).where(:created_at => start_date..end_date).sum(:monto)
    @neto = @ventas + @clientes - @gastos- @proveedores
     respond_to do |format|
        format.html {render :balances}
        format.js
        end
  end

  # DELETE /cierres/1
  # DELETE /cierres/1.json
  def destroy
    @cierre.destroy
    respond_to do |format|
      format.html { redirect_to cierres_url, notice: 'Cierre was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cierre
      @cierre = Cierre.find(params[:id])
    end

    def set_negocio
      @negocio = Negocio.find(params[:negocio_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cierre_params
      params.require(:cierre).permit(:usuario_id, :hora_inicial, :hora_final, :monto_inicial, :monto_final, :estado, :rendido, :fecha, :observacion, :caja_id, :negocio_id)
    end
end
