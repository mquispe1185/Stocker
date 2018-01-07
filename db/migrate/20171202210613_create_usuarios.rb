class CreateUsuarios < ActiveRecord::Migration[5.0]
  def change
    create_table :usuarios do |t|
      t.string :usuario
      t.string :password_digest
      t.string :nombre
      t.references :negocio, foreign_key: true
      t.string :rol

      t.timestamps
    end
  end
end
