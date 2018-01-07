class AddColumnToPedidos < ActiveRecord::Migration[5.0]
  def change
    add_column :pedidos, :realizado, :boolean, default: false
   
  end
end
