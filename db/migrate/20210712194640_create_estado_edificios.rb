class CreateEstadoEdificios < ActiveRecord::Migration[6.1]
  def change
    create_table :estado_edificios do |t|
      t.integer :Em22
      t.integer :Em21
      t.integer :Kki
      t.integer :Kkm
      t.integer :Puzolana
      t.integer :Yeso
      t.integer :Trans_cemento
      t.integer :Enfriadera
      t.integer :Techo_ccm_h9
      t.integer :Patio_M22
      t.integer :Niagara
      t.integer :EM17
      t.integer :Bba_flux
      t.integer :Area_202
      t.integer :Basculas
      t.integer :Em_18_19
      t.integer :Taller_electrico
      t.integer :CI01CK01
      t.integer :Silos_superiores
      t.integer :Secador
      t.text :comentarios

      t.timestamps
    end
  end
end
