class Truck < ApplicationRecord
  belongs_to :mmpp


  before_save do
    self.wait = ((self.salida - self.llegada) / 60).to_i  
  end

end
