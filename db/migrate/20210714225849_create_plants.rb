class CreatePlants < ActiveRecord::Migration[6.1]
  def change
    create_table :plants do |t|
      t.string :descripcion
      t.integer :personal
      t.string :otros

      t.timestamps
    end
  end
end
