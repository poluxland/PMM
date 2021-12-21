class CreateBarredoras < ActiveRecord::Migration[6.1]
  def change
    create_table :barredoras do |t|
      t.integer :patio_h9
      t.integer :m21_m22
      t.integer :san_diego
      t.integer :j09
      t.integer :circunvalacion
      t.integer :mmpp
      t.integer :a202
      t.integer :coke
      t.integer :cal
      t.string :comentarios

      t.timestamps
    end
  end
end
