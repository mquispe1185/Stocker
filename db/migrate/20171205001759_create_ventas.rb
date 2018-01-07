class CreateVentas < ActiveRecord::Migration[5.0]
  def change
    create_table :ventas do |t|
      t.integer :ticket
      t.references :usuario, foreign_key: true
      t.date :fecha
      t.decimal :total

      t.timestamps
    end
  end
end
