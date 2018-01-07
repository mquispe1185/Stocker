class CreatePagoClientes < ActiveRecord::Migration[5.0]
  def change
    create_table :pago_clientes do |t|
      t.references :cuenta_cliente, foreign_key: true
      t.decimal :monto
      t.references :usuario, foreign_key: true
      t.string :observacion

      t.timestamps
    end
  end
end
