class CreateDetalleClientes < ActiveRecord::Migration[5.0]
  def change
    create_table :detalle_clientes do |t|
      t.references :cuenta_cliente, foreign_key: true
      t.references :usuario, foreign_key: true
      t.string :detalle
      t.decimal :monto

      t.timestamps
    end
  end
end
