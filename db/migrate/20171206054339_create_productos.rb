class CreateProductos < ActiveRecord::Migration[5.0]
  def change
    create_table :productos do |t|
      t.integer :codigo
      t.string :descripcion
      t.decimal :stock
      t.decimal :minimo
      t.string :unidad
      t.decimal :precio
      t.decimal :costo
      t.references :negocio, foreign_key: true
      t.references :proveedor, foreign_key: true

      t.timestamps
    end
  end
end
