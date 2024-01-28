class CreateTrabajos < ActiveRecord::Migration[6.1]
  def change
    create_table :trabajos do |t|
      t.date :inicio
      t.date :termino
      t.string :area
      t.string :supervisor
      t.string :descripcion

      t.timestamps
    end
  end
end
