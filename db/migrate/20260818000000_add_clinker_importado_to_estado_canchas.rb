class AddClinkerImportadoToEstadoCanchas < ActiveRecord::Migration[6.1]
  def change
    add_column :estado_canchas, :clinker_importado, :integer
  end
end
