class CreateChecklists < ActiveRecord::Migration[6.0]
  def change
    create_table :checklists do |t|
      t.string :nombre
      t.date :fecha
      t.string :cinta
      t.string :lubricacion
      t.string :aseos
      t.string :nivel
      t.string :fugas
      t.integer :presion
      t.string :filtro1
      t.string :filtro2
      t.string :polvo
      t.string :raspador
      t.string :iluminacion
      t.text :comentarios

      t.timestamps
    end
  end
end
