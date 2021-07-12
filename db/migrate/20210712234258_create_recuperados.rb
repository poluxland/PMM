class CreateRecuperados < ActiveRecord::Migration[6.1]
  def change
    create_table :recuperados do |t|
      t.float :EM22
      t.float :Sepax
      t.float :Filtax
      t.float :Puzolana
      t.float :Yeso
      t.float :Silo_KKI
      t.float :cola_H9
      t.float :Aire_terciario
      t.float :Filtro_enfriadera
      t.float :EM21
      t.float :Aux_H9
      t.float :Skako
      t.float :Niagara
      t.float :CI08F01
      t.float :Coke
      t.float :Exterior_molinos_MP
      t.float :Cintas_MP
      t.text :comentarios

      t.timestamps
    end
  end
end
