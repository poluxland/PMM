class CreateMantenimientos < ActiveRecord::Migration[6.1]
  def change
    create_table :mantenimientos do |t|
      t.date :fecha_programada
      t.date :fecha_ejecucion
      t.string :area
      t.string :tarea
      t.string :clase
      t.string :departamento
      t.string :estado
      t.string :observacion

      t.timestamps
    end
  end
end
