class CreateSectors < ActiveRecord::Migration[6.1]
  def change
    create_table :sectors do |t|
      t.string :area
      t.string :instalacion

      t.timestamps
    end
  end
end
