class ChangeCodigoProductoType < ActiveRecord::Migration[5.0]
  def change
  	change_column :productos, :codigo, :string
  end
end
