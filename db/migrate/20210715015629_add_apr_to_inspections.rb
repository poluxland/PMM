class AddAprToInspections < ActiveRecord::Migration[6.1]
  def change
    add_reference :inspections, :apr, null: false, foreign_key: true
  end
end
