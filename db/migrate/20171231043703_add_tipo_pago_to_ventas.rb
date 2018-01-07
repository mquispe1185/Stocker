class AddTipoPagoToVentas < ActiveRecord::Migration[5.0]
  def change
    add_reference :ventas, :tipo_pago, foreign_key: true
    add_reference :tipo_pagos, :negocio, foreign_key: true
    add_column :tipo_pagos, :modificador, :decimal, precision: 8, scale: 2

  end
end
