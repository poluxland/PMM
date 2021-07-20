class Recuperado < ApplicationRecord

    before_save do
        self.total = (self.EM22.to_f  + self.Sepax.to_f  + self.Filtax.to_f   + self.Puzolana.to_f  + self.Yeso.to_f  + self.Silo_KKI.to_f  + self.cola_H9.to_f  + self.Aire_terciario.to_f  + self.Filtro_enfriadera.to_f  + self.EM21.to_f  + self.Aux_H9.to_f  + self.Skako.to_f  + self.Niagara.to_f  + self.CI08F01.to_f  + self.Coke.to_f  + self.Exterior_molinos_MP.to_f  + self.Cintas_MP.to_f )
      end

end
