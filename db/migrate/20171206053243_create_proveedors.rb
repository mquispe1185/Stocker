class CreateProveedors < ActiveRecord::Migration[5.0]
  def change
    create_table :proveedors do |t|
      t.string :nombre
      t.string :telefono
      t.string :celular
      t.string :email
      t.string :domicilio
      t.string :descripcion
      t.references :negocio, foreign_key: true

      t.timestamps
    end
  end
end
