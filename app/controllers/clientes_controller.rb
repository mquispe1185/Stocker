class ClientesController < ApplicationController
  before_action :set_cliente, only: [:show, :edit, :update, :destroy]
  before_action :set_negocio
  # GET /clientes
  # GET /clientes.json
  def index
    @clientes = @negocio.clientes
  end

  # GET /clientes/1
  # GET /clientes/1.json
  def show
  end

  # GET /clientes/new
  def new
    @cliente = @negocio.clientes.new
    @clientes = Cliente.where(negocio_id: @negocio.id)
  end

  # GET /clientes/1/edit
  def edit
  end

  # POST /clientes
  # POST /clientes.json
  def create
    @cliente = @negocio.clientes.new(cliente_params)
    @clientes = @negocio.clientes
    
      if @cliente.save
     respond_to do |format|
        format.html {render :new}
        format.js
        end
    
    end
  end

  # PATCH/PUT /clientes/1
  # PATCH/PUT /clientes/1.json
  def update
    respond_to do |format|
      if @cliente.update(cliente_params)
        format.html { redirect_to new_negocio_cliente_url, notice: 'Datos de cliente actualizados!' }
        format.json { render :show, status: :ok, location: @cliente }
      else
        format.html { render :edit }
        format.json { render json: @cliente.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /clientes/1
  # DELETE /clientes/1.json
  def destroy
    @clientes = @negocio.clientes
    @cliente.destroy
    respond_to do |format|
        format.html {render :new}
        format.js
        end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cliente
      @cliente = Cliente.find(params[:id])
    end

     def set_negocio
      @negocio = Negocio.find(params[:negocio_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cliente_params
      params.require(:cliente).permit(:negocio_id, :nombre, :direccion, :telefono, :email)
    end
end
