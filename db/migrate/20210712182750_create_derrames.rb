class CreateDerrames < ActiveRecord::Migration[6.1]
  def change
    create_table :derrames do |t|
      t.integer :EM22
      t.integer :Sepax
      t.integer :Filtax
      t.integer :Puzolana
      t.integer :Yeso
      t.integer :Silo_KKI
      t.integer :cola_H9
      t.integer :Aire_terciario
      t.integer :Filtro_enfriadera
      t.integer :EM21
      t.integer :Aux_H9
      t.integer :Skako
      t.integer :Niagara
      t.integer :CI08F01
      t.integer :Coke
      t.integer :Exterior_molinos_MP
      t.integer :Cintas_MP
      t.text :comentarios

      t.timestamps
    end
  end
end
