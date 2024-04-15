class AddClinkerToEstadoCanchas < ActiveRecord::Migration[6.1]
  def change
    add_column :estado_canchas, :clinker_a, :integer
    add_column :estado_canchas, :clinker_b, :integer
  end
end
