class CreateTrucks < ActiveRecord::Migration[6.0]
  def change
    create_table :trucks do |t|
      t.date :fecha
      t.references :mmpp, null: false, foreign_key: true
      t.string :tipo
      t.time :llegada
      t.time :llamada
      t.time :salida

      t.timestamps
    end
  end
end
