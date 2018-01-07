class CreateDetalleVentas < ActiveRecord::Migration[5.0]
  def change
    create_table :detalle_ventas do |t|
      t.references :producto, foreign_key: true
      t.decimal :cantidad
      t.decimal :modificador
      t.string :subtotal
      t.references :venta, foreign_key: true

      t.timestamps
    end
  end
end
