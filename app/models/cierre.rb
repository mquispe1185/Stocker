class Cierre < ApplicationRecord
  belongs_to :usuario

  belongs_to :negocio
  has_many :ventas
  has_many :gastos
  has_many :detalle_cierres
end
