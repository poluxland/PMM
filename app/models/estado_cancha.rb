class EstadoCancha < ApplicationRecord
  after_create :send_canchas_email

  private

  def send_canchas_email
    UserMailer.with(user: self).estado_canchas.deliver_now
  end
end
