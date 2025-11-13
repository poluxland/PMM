class AddIndexesToTrucks < ActiveRecord::Migration[6.1]
  def change
    add_index :trucks, :fecha
    add_index :trucks, :wait
    add_index :trucks, :tipo

    add_index :trucks, [:fecha, :tipo]
    add_index :trucks, [:fecha, :wait]
    add_index :trucks, [:fecha, :mmpp_id]
  end
end
