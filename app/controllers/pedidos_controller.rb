class PedidosController < ApplicationController
  before_action :set_pedido, only: [:show, :edit, :update, :destroy]
  before_action :logged_in_user, only: [:new,:create,:edit]
  before_action :set_negocio
  # GET /pedidos
  # GET /pedidos.json
  def index
    @pedidos = @negocio.pedidos.where(realizado: false)
    @pedidos_enviados = @negocio.pedidos.where(realizado: true, recibido: false)
  end

  # GET /pedidos/1
  # GET /pedidos/1.json
  def show
  end

  # GET /pedidos/new
  def new
    @pedido = Pedido.new
  end

  # GET /pedidos/1/edit
  def edit
  end

  # POST /pedidos
  # POST /pedidos.json
  def create
    @pedido = Pedido.new(pedido_params)

    
      if @pedido.save
        flash[:success] = "Pedido creado!"
      redirect_to negocio_lista_productos_url(pedido_id: @pedido.id) 
   
    end
  end

  # PATCH/PUT /pedidos/1
  # PATCH/PUT /pedidos/1.json
  def update
    @pedidos = @negocio.pedidos.where(realizado: false)
    @pedidos_enviados = @negocio.pedidos.where(realizado: true, recibido: false)
      if @pedido.update(bool_params)
       render "index"
       
    end
  end

  # DELETE /pedidos/1
  # DELETE /pedidos/1.json
  def destroy
    @pedido.destroy
      flash[:danger] = "Pedido eliminado"
     redirect_to negocio_pedidos_url
     
  end

  def filtrar_productos
      @productos = Producto.where(proveedor_id: params[:pedido][:proveedor_id])
     # render 'pedidos/_tabla_productos'
     #render "pedidos/new", :locals => {:partial => "tabla_productos", productos: @productos}, :layout => true
     #render :new
     respond_to do |format|
        #format.html {render :new}
        format.js
    end
  end

  def lista_productos
      @pedido = Pedido.find(params[:pedido_id])
       @productos = Producto.where(proveedor_id: @pedido.proveedor_id)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pedido
      @pedido = Pedido.find(params[:id])
    end

    def set_negocio
      @negocio = Negocio.find(params[:negocio_id])
     
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pedido_params

      params.require(:pedido).permit(:usuario_id, :proveedor_id, :negocio_id, :realizado, :recibido)
    end

    def bool_params
      params.permit(:realizado,:recibido)
    end
end
