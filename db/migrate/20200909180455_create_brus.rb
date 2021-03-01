# frozen_string_literal: true

class CreateBrus < ActiveRecord::Migration[6.0]
  def change
    create_table :brus do |t|
      t.date :fecha
      t.time :ingreso
      t.time :salida
      t.string :patente
      t.string :mmpp
      t.string :comentarios
      t.integer :numero

      t.timestamps
    end
  end
end
