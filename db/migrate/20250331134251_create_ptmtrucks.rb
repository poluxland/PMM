class CreatePtmtrucks < ActiveRecord::Migration[6.1]
  def change
    create_table :ptmtrucks do |t|
      t.string :patente
      t.string :mmpp
      t.datetime :ingreso
      t.datetime :salida
      t.string :causa
      t.text :otros

      t.timestamps
    end
  end
end
