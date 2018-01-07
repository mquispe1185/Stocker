class Proveedor < ApplicationRecord
  belongs_to :negocio
  has_many :productos
  has_many :cuenta_proveedors
end
