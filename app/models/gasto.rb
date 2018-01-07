class Gasto < ApplicationRecord
  belongs_to :categoria
  belongs_to :usuario
  belongs_to :negocio
  belongs_to :cierre
end
