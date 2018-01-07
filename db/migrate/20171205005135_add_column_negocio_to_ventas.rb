class AddColumnNegocioToVentas < ActiveRecord::Migration[5.0]
  def change
    add_reference :ventas, :negocio, foreign_key: true
  end
end
