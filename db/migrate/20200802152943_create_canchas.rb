class CreateCanchas < ActiveRecord::Migration[6.0]
  def change
    create_table :canchas do |t|
      t.string :nombre
      t.string :descripcion
      t.integer :capacidad
      t.boolean :operativa
      t.references :mmpp, null: false, foreign_key: true

      t.timestamps
    end
  end
end
