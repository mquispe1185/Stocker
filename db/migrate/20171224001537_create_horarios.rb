class CreateHorarios < ActiveRecord::Migration[5.0]
  def change
    create_table :horarios do |t|
      t.references :usuario, foreign_key: true
      t.datetime :final
      t.datetime :duracion
      t.boolean :cerrado, default: false
      t.timestamps
    end
  end
end
