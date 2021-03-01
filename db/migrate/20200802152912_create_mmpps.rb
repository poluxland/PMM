# frozen_string_literal: true

class CreateMmpps < ActiveRecord::Migration[6.0]
  def change
    create_table :mmpps do |t|
      t.string :nombre
      t.string :descripcion
      t.integer :densidad

      t.timestamps
    end
  end
end
