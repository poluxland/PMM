class CreateCheckListDespachoCamions < ActiveRecord::Migration[6.1]
  def change
    create_table :check_list_despacho_camions do |t|
      t.date :fecha
      t.string :inspector
      t.string :patente
      t.string :producto
      t.integer :cantidad
      t.boolean :limpieza_del_saco
      t.boolean :armado_correcto_del_pallet
      t.boolean :sacos_rotos
      t.boolean :tipo_de_producto_correcto
      t.boolean :cantidad_de_pallets_o_sacos
      t.boolean :correcto_enfundado
      t.string :comentarios

      t.timestamps
    end
  end
end
