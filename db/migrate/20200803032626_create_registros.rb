# frozen_string_literal: true

class CreateRegistros < ActiveRecord::Migration[6.0]
  def change
    create_table :registros do |t|
      t.references :cancha, null: false, foreign_key: true
      t.integer :uso
      t.string :fotografia

      t.timestamps
    end
  end
end
