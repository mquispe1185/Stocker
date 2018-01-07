class AddColumnToCaja < ActiveRecord::Migration[5.0]
  def change
    add_reference :cajas, :negocio, foreign_key: true
    add_reference :categorias, :negocio, foreign_key: true
    add_column :cuenta_proveedores, :monto_inicial, :decimal
  end
end
