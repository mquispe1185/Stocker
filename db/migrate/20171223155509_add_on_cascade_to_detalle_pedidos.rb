class AddOnCascadeToDetallePedidos < ActiveRecord::Migration[5.0]
  def change
  	remove_foreign_key :detalle_pedidos, :pedidos
  	add_foreign_key :detalle_pedidos, :pedidos, on_delete: :cascade
  
  end
end
