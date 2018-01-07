class CreateCuentaProveedores < ActiveRecord::Migration[5.0]
  def change
    create_table :cuenta_proveedores do |t|
      t.references :proveedor, foreign_key: true
      t.references :negocio, foreign_key: true
      t.decimal :monto_adeudado
      t.string :observacion

      t.timestamps
    end
  end
end
