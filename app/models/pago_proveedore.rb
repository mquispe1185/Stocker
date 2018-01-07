class PagoProveedore < ApplicationRecord
  belongs_to :cuenta_proveedor
  belongs_to :usuario
  belongs_to :negocio
end
