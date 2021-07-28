class CreateEnvasadoras < ActiveRecord::Migration[6.1]
  def change
    create_table :envasadoras do |t|
      t.integer :llenado_bb
      t.integer :bodega_bb
      t.integer :costado
      t.integer :silo_28
      t.integer :bba_fuller
      t.integer :exterior_bodega
      t.integer :carga_ventomatic
      t.integer :calle_servicio
      t.integer :edificio_ventomatic
      t.integer :edificio_haver
      t.integer :palletizador_haver
      t.integer :recuperado_bb
      t.integer :sector_escombros
      t.text :comentarios

      t.timestamps
    end
  end
end
