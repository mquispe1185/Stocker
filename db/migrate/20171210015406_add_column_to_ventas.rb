class AddColumnToVentas < ActiveRecord::Migration[5.0]
  def change
    add_column :ventas, :estado, :boolean
  end
end
