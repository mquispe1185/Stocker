class CreateCierres < ActiveRecord::Migration[5.0]
  def change
    create_table :cierres do |t|
      t.references :usuario, foreign_key: true
      t.time :hora_inicial
      t.time :hora_final
      t.decimal :monto_inicial
      t.decimal :monto_final
      t.boolean :estado
      t.boolean :rendido
      t.date :fecha
      t.string :observacion
      t.references :caja, foreign_key: true
      t.references :negocio, foreign_key: true

      t.timestamps
    end
  end
end
