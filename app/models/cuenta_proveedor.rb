class CuentaProveedor < ApplicationRecord
  belongs_to :proveedor
  belongs_to :negocio
end
