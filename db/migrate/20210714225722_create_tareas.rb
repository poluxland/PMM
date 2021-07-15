class CreateTareas < ActiveRecord::Migration[6.1]
  def change
    create_table :tareas do |t|
      t.string :descripcion
      t.integer :criticidad
      t.string :otros

      t.timestamps
    end
  end
end
