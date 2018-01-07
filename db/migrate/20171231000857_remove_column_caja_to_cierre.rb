class RemoveColumnCajaToCierre < ActiveRecord::Migration[5.0]
  def change
  	remove_column :cierres, :caja_id, :integer
  end
end
