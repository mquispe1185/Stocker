class AddColumnToGastos < ActiveRecord::Migration[5.0]
  def change
  	add_column :gastos, :rendido, :boolean
  	add_reference :gastos, :cierre, foreign_key: true
  	add_reference :ventas, :cierre, foreign_key: true
  end
end
