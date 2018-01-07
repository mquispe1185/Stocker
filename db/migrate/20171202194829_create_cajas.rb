class CreateCajas < ActiveRecord::Migration[5.0]
  def change
    create_table :cajas do |t|
      t.string :nombre

      t.timestamps
    end
  end
end
