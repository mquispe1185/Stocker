class DetalleCliente < ApplicationRecord
  belongs_to :cuenta_cliente
  belongs_to :usuario
end
