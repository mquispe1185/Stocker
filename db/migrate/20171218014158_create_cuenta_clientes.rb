class CreateCuentaClientes < ActiveRecord::Migration[5.0]
  def change
    create_table :cuenta_clientes do |t|
      t.references :cliente, foreign_key: true
      t.decimal :monto_adeudado
      t.string :observacion

      t.timestamps
    end
  end
end
