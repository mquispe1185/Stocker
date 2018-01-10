class CreateDetalleCierres < ActiveRecord::Migration[5.0]
  def change
    create_table :detalle_cierres do |t|
      t.references :cierre, foreign_key: true
      t.string :descripcion
      t.decimal :monto

      t.timestamps
    end
  end
end
