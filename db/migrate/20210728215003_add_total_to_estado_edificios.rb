class AddTotalToEstadoEdificios < ActiveRecord::Migration[6.1]
  def change
    add_column :estado_edificios, :total, :integer
  end
end
