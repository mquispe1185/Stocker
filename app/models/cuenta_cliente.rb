class CuentaCliente < ApplicationRecord
  belongs_to :cliente
  belongs_to :negocio
  has_many :pago_clientes
  has_many :detalle_clientes
end
