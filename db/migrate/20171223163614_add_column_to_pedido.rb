class AddColumnToPedido < ActiveRecord::Migration[5.0]
  def change
    add_column :pedidos, :recibido, :boolean, default: false
  end
end
