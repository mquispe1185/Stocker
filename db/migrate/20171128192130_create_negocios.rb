class CreateNegocios < ActiveRecord::Migration[5.0]
  def change
    create_table :negocios do |t|
      t.string :nombre
      t.string :direccion
      t.string :telefono
      t.string :cuit
      t.date :alta
      t.date :expiracion_licencia
      t.boolean :validado
      t.references :admin, foreign_key: true

      t.timestamps
    end
  end
end
