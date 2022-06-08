class Evaluacion < ApplicationRecord
  belongs_to :sector


  before_save do
    self.promedio = ((self.barrido + self.orden + self.derrames)/3).to_i
  end

end
