class CreatePedidos < ActiveRecord::Migration[5.0]
  def change
    create_table :pedidos do |t|
      t.references :usuario, foreign_key: true
      t.references :proveedor, foreign_key: true
      t.references :negocio, foreign_key: true

      t.timestamps
    end
  end
end
