class CreateAdmins < ActiveRecord::Migration[5.0]
  def change
    create_table :admins do |t|
      t.string :usuario
      t.string :password
      t.string :email
      t.string :nombre
      t.string :telefono

      t.timestamps
    end
  end
end
