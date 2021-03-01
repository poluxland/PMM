# frozen_string_literal: true

class AddPatenteToTrucks < ActiveRecord::Migration[6.1]
  def change
    add_column :trucks, :patente, :string
  end
end
