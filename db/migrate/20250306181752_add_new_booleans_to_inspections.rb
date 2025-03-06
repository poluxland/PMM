class AddNewBooleansToInspections < ActiveRecord::Migration[6.1]
  def change
    add_column :inspections, :sala_de_soplado, :boolean
    add_column :inspections, :jetin, :boolean
    add_column :inspections, :estado_general_de_herramientas, :boolean
  end
end
