class TipoPagosController < ApplicationController
  before_action :set_tipo_pago, only: [:show, :edit, :update, :destroy]
  before_action :set_negocio
  # GET /tipo_pagos
  # GET /tipo_pagos.json
  def index
    @tipo_pagos = @negocio.tipo_pagos
  end

  # GET /tipo_pagos/1
  # GET /tipo_pagos/1.json
  def show
  end

  # GET /tipo_pagos/new
  def new
    @tipo_pago = @negocio.tipo_pagos.new
    @tipo_pagos = @negocio.tipo_pagos
  end

  # GET /tipo_pagos/1/edit
  def edit
  end

  # POST /tipo_pagos
  # POST /tipo_pagos.json
  def create
    @tipo_pago = @negocio.tipo_pagos.new(tipo_pago_params)
    @tipo_pagos = @negocio.tipo_pagos
    respond_to do |format|
      if @tipo_pago.save

        format.html { render :new}
        format.js
     
      end
    end
  end

  # PATCH/PUT /tipo_pagos/1
  # PATCH/PUT /tipo_pagos/1.json
  def update
    respond_to do |format|
      if @tipo_pago.update(tipo_pago_params)
        format.html { redirect_to @tipo_pago, notice: 'Tipo pago was successfully updated.' }
        format.json { render :show, status: :ok, location: @tipo_pago }
      else
        format.html { render :edit }
        format.json { render json: @tipo_pago.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tipo_pagos/1
  # DELETE /tipo_pagos/1.json
  def destroy
    @tipo_pago.destroy
    respond_to do |format|
      format.html { redirect_to tipo_pagos_url, notice: 'Tipo pago was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tipo_pago
      @tipo_pago = TipoPago.find(params[:id])
    end

     def set_negocio
      @negocio = Negocio.find(params[:negocio_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tipo_pago_params
      params.require(:tipo_pago).permit(:descripcion,:modificador,:negocio_id)
    end
end
