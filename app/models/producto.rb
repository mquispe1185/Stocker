class Producto < ApplicationRecord
  belongs_to :negocio
  belongs_to :proveedor
  has_many :detalle_ventas
end
