class AddTotalToEnvasadoras < ActiveRecord::Migration[6.1]
  def change
    add_column :envasadoras, :total, :integer
  end
end
