class Venta < ApplicationRecord
  belongs_to :usuario
  belongs_to :negocio
  belongs_to :cierre
  belongs_to :caja
  has_many :detalle_ventas

end
