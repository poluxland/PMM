class CreateReportes < ActiveRecord::Migration[6.1]
  def change
    create_table :reportes do |t|
      t.string :control
      t.string :notas
      t.integer :avance
      t.integer :inactividad
      t.references :trabajo, null: false, foreign_key: true

      t.timestamps
    end
  end
end
