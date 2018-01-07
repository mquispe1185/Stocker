class AddColumnToHorario < ActiveRecord::Migration[5.0]
  def change
    add_reference :horarios, :negocio, foreign_key: true
    add_column :productos, :vencimiento, :datetime
  end
end
