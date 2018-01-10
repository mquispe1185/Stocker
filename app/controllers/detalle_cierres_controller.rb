class DetalleCierresController < ApplicationController
  before_action :set_detalle_cierre, only: [:show, :edit, :update, :destroy]
  before_action :set_cierre
  # GET /detalle_cierres
  # GET /detalle_cierres.json
  def index
    @detalle_cierres = @cierre.detalle_cierres.all
  end

  # GET /detalle_cierres/1
  # GET /detalle_cierres/1.json
  def show
  end

  # GET /detalle_cierres/new
  def new
    @detalle_cierre = DetalleCierre.new
  end

  # GET /detalle_cierres/1/edit
  def edit
  end

  # POST /detalle_cierres
  # POST /detalle_cierres.json
  def self.create(id,desc,monto)
    @detalle_cierre = DetalleCierre.new(cierre_id: id, descripcion: desc, monto: monto)
    @detalle_cierre.save
   
  end

  # PATCH/PUT /detalle_cierres/1
  # PATCH/PUT /detalle_cierres/1.json
  def update
    respond_to do |format|
      if @detalle_cierre.update(detalle_cierre_params)
        format.html { redirect_to @detalle_cierre, notice: 'Detalle cierre was successfully updated.' }
        format.json { render :show, status: :ok, location: @detalle_cierre }
      else
        format.html { render :edit }
        format.json { render json: @detalle_cierre.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /detalle_cierres/1
  # DELETE /detalle_cierres/1.json
  def destroy
    @detalle_cierre.destroy
    respond_to do |format|
      format.html { redirect_to detalle_cierres_url, notice: 'Detalle cierre was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_detalle_cierre
      @detalle_cierre = DetalleCierre.find(params[:id])
    end

    def set_cierre
      
      @cierre = Cierre.find(params[:cierre_id])
      @negocio = Negocio.find(params[:negocio_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def detalle_cierre_params
      params.require(:detalle_cierre).permit(:cierre_id, :descripcion, :monto)
    end
end
