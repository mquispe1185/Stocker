class RemoveColumnToCierre < ActiveRecord::Migration[5.0]
  def change
  	remove_foreign_key :cierres, :cajas
  	add_reference :ventas, :caja, foreign_key: true
  end
end
