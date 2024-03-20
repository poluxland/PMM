class CreateInformes < ActiveRecord::Migration[6.1]
  def change
    create_table :informes do |t|
      t.date :fecha
      t.integer :especial_sin_funda
      t.integer :especial_soluble
      t.integer :especial_enfundado
      t.integer :extra_sin_funda
      t.integer :extra_soluble
      t.integer :extra_enfundado
      t.integer :big_bag_extra_sin_peba
      t.integer :big_bag_extra_con_peba
      t.integer :big_bag_especial_sin_peba
      t.integer :big_bag_especial_con_peba
      t.integer :produccion_especial
      t.integer :produccion_extra
      t.time :inicio_produccion
      t.time :termino_produccion
      t.integer :envases_especial
      t.integer :envases_extra
      t.integer :envases_big_bag
      t.integer :pallets_buenos
      t.integer :bobinas_plastificado
      t.text :observaciones

      t.timestamps
    end
  end
end
