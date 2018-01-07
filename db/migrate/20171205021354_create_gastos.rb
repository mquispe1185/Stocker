class CreateGastos < ActiveRecord::Migration[5.0]
  def change
    create_table :gastos do |t|
      t.string :descripcion
      t.references :categoria, foreign_key: true
      t.references :usuario, foreign_key: true
      t.references :negocio, foreign_key: true
      t.decimal :monto

      t.timestamps
    end
  end
end
