class CreateTraslados < ActiveRecord::Migration[6.1]
  def change
    create_table :traslados do |t|
      t.integer :valor
      t.string :lugar
      t.text :observaciones
      t.string :centro_de_costo
      t.string :estado
      t.text :comentario

      t.timestamps
    end
  end
end
