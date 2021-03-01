# frozen_string_literal: true

class AddDetailsToTrucks < ActiveRecord::Migration[6.1]
  def change
    add_column :trucks, :wait, :integer
    add_column :trucks, :cause, :string
    add_column :trucks, :motive, :text
    add_column :trucks, :number, :integer
    add_column :trucks, :other, :string
  end
end
