class AddColumnToPagoProveedores < ActiveRecord::Migration[5.0]
  def change
    add_column :pago_proveedores, :rendido, :boolean, default: false
    add_column :pago_clientes, :rendido, :boolean, default: false

  end
end
