# frozen_string_literal: true

class Truck < ApplicationRecord
  belongs_to :mmpp

  before_save do
    self.wait = ((salida - llegada) / 60).to_i
  end
end
