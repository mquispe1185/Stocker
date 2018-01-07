class DetalleVenta < ApplicationRecord
  belongs_to :producto
  belongs_to :venta
end
