class CreateDetallePedidos < ActiveRecord::Migration[5.0]
  def change
    create_table :detalle_pedidos do |t|
      t.references :pedido, foreign_key: true
      t.references :producto, foreign_key: true
      t.decimal :cantidad

      t.timestamps
    end
  end
end
