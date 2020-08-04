class CreateLvs < ActiveRecord::Migration[6.0]
  def change
    create_table :lvs do |t|
      t.string :proceso
      t.string :obervado
      t.string :observador
      t.string :altura
      t.string :izaje
      t.string :eemm
      t.string :lototo

      t.timestamps
    end
  end
end
