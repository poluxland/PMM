class Informe < ApplicationRecord
    validates :especial_sin_funda, :especial_soluble, :especial_enfundado, :extra_sin_funda, :extra_soluble, :extra_enfundado, :big_bag_extra_sin_peba, :big_bag_extra_con_peba, :big_bag_especial_sin_peba, :big_bag_especial_con_peba, :produccion_especial, :produccion_extra, :inicio_produccion, :termino_produccion, :envases_especial, :envases_extra, :envases_big_bag, :pallets_buenos, :bobinas_plastificado, presence: true

  after_create :send_informes_email





  def send_informes_email
    UserMailer.with(user: self).informes.deliver_now
  end
end

