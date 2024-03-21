class AddFieldsToInformes < ActiveRecord::Migration[6.1]
  def change
    add_column :informes, :envase_especial_soluble, :integer
    add_column :informes, :envase_extra_soluble, :integer
    add_column :informes, :envase_bigbag_con_peba, :integer
    add_column :informes, :fifo_1_especial, :date
    add_column :informes, :fifo_2_especial, :date
    add_column :informes, :fifo_3_especial, :date
    add_column :informes, :fifo_4_especial, :date
    add_column :informes, :fifo_5_especial, :date
    add_column :informes, :fifo_6_especial, :date
    add_column :informes, :fifo_7_especial, :date
    add_column :informes, :fifo_8_extra, :date
    add_column :informes, :fifo_9_extra, :date
  end
end
