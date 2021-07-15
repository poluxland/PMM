class CreateAreas < ActiveRecord::Migration[6.1]
  def change
    create_table :areas do |t|
      t.string :descripcion
      t.integer :criticidad
      t.string :otros

      t.timestamps
    end
  end
end
