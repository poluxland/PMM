class CreateEvaluacions < ActiveRecord::Migration[6.1]
  def change
    create_table :evaluacions do |t|
      t.references :sector, null: false, foreign_key: true
      t.integer :barrido
      t.integer :orden
      t.integer :derrames
      t.integer :promedio
      t.string :comentarios

      t.timestamps
    end
  end
end
