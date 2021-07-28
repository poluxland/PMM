class CreatePuzolanas < ActiveRecord::Migration[6.1]
  def change
    create_table :puzolanas do |t|
      t.string :C403BC02_tensado_cinta
      t.string :C403BC02_alineamiento
      t.string :C403BC02_Polines
      t.string :C403BC02_fugas
      t.string :C403BC03_tensado_cinta
      t.string :C403BC03_alineamiento
      t.string :C403BC03_Polines
      t.string :C403BC03_fugas
      t.string :C403BC04_tensado_cinta
      t.string :C403BC04_alineamiento
      t.string :C403BC04_Polines
      t.string :C403BC04_fugas
      t.string :C403BC05_tensado_cinta
      t.string :C403BC05_alineamiento
      t.string :C403BC05_Polines
      t.string :C403BC05_fugas
      t.string :C403BC06_tensado_cinta
      t.string :C403BC06_alineamiento
      t.string :C403BC06_polines
      t.string :C403BC06_fugas

      t.timestamps
    end
  end
end
