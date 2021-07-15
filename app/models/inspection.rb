class Inspection < ApplicationRecord
  belongs_to :plant
  belongs_to :area
  belongs_to :tarea
  belongs_to :supervisor
  belongs_to :apr
end
