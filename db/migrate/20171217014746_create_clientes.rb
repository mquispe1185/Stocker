class CreateClientes < ActiveRecord::Migration[5.0]
  def change
    create_table :clientes do |t|
      t.references :negocio, foreign_key: true
      t.string :nombre
      t.string :direccion
      t.string :telefono
      t.string :email

      t.timestamps
    end
  end
end
