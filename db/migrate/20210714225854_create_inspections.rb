class CreateInspections < ActiveRecord::Migration[6.1]
  def change
    create_table :inspections do |t|
      t.references :plant, null: false, foreign_key: true
      t.references :area, null: false, foreign_key: true
      t.references :tarea, null: false, foreign_key: true
      t.references :supervisor, null: false, foreign_key: true
      t.integer :trabajadores
      t.boolean :ast
      t.boolean :pts
      t.boolean :epp
      t.boolean :subsitio
      t.integer :cumplimiento
      t.text :comentarios

      t.timestamps
    end
  end
end
