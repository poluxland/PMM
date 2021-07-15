class CreateSupervisors < ActiveRecord::Migration[6.1]
  def change
    create_table :supervisors do |t|
      t.string :nombre
      t.string :rut
      t.string :cargo
      t.integer :año_ingreso
      t.string :otros

      t.timestamps
    end
  end
end
