class AddTotalToRecuperados < ActiveRecord::Migration[6.1]
  def change
    add_column :recuperados, :total, :float
  end
end
