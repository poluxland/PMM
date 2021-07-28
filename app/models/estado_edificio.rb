class EstadoEdificio < ApplicationRecord

   
    before_save do
        self.total = ((self.Em22.to_i + self.Em21.to_i + self.Kki.to_i + self.Kkm.to_i + self.Puzolana.to_i + self.Yeso.to_i + self.Trans_cemento.to_i + self.Enfriadera.to_i + self.Techo_ccm_h9.to_i + self.Patio_M22.to_i + self.Niagara.to_i + self.EM17.to_i + self.Bba_flux.to_i + self.Area_202.to_i + self.Basculas.to_i + self.Em_18_19.to_i + self.Taller_electrico.to_i + self.CI01CK01.to_i + self.Silos_superiores.to_i + self.Secador.to_i) / 20
    )
   
    end


     
end
