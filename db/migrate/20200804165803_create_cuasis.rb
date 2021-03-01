# frozen_string_literal: true

class CreateCuasis < ActiveRecord::Migration[6.0]
  def change
    create_table :cuasis do |t|
      t.string :sitio
      t.date :fecha
      t.string :reporta
      t.string :potencial
      t.string :accion
      t.string :responsable
      t.string :estado

      t.timestamps
    end
  end
end
