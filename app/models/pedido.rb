class Pedido < ApplicationRecord
  belongs_to :usuario
  belongs_to :proveedor
  belongs_to :negocio
  has_many :detalle_pedidos
end
