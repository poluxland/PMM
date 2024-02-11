class AddDetalleToTrabajos < ActiveRecord::Migration[6.1]
  def change
    add_column :trabajos, :detalle, :text
  end
end
