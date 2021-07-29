class Envasadora < ApplicationRecord


    before_save do
        self.total = ((self.llenado_bb.to_i + self.bodega_bb.to_i + self.costado.to_i + self.silo_28.to_i + self.bba_fuller.to_i + self.exterior_bodega.to_i + self.carga_ventomatic.to_i + self.calle_servicio.to_i + self.edificio_ventomatic.to_i + self.edificio_haver.to_i + self.palletizador_haver.to_i + self.recuperado_bb.to_i + self.sector_escombros.to_i ) / 13
    )
   
    end
end
