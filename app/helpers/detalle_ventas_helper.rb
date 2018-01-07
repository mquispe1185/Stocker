module DetalleVentasHelper
	def lista_detalle(venta)
		@lista_detalle= VentaDetalle.where(venta_id: venta.id)
	end
end
