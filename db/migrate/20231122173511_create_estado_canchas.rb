class CreateEstadoCanchas < ActiveRecord::Migration[6.1]
  def change
    create_table :estado_canchas do |t|
      t.integer :quilimari
      t.integer :cachinales
      t.integer :ñilhue
      t.integer :caolin
      t.integer :fierro
      t.integer :puzolana
      t.integer :tunga
      t.integer :ceniza
      t.integer :yeso
      t.integer :conchuela
      t.integer :san_pedro
      t.text :observaciones

      t.timestamps
    end
  end
end
