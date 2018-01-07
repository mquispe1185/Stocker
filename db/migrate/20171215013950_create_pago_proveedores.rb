class CreatePagoProveedores < ActiveRecord::Migration[5.0]
  def change
    create_table :pago_proveedores do |t|
      t.references :cuenta_proveedor, foreign_key: true
      t.decimal :monto
      t.references :usuario, foreign_key: true
      t.string :observacion

      t.timestamps
    end
  end
end
