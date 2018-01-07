json.extract! detalle_venta, :id, :producto_id, :cantidad, :modificador, :subtotal, :venta_id, :created_at, :updated_at
json.url detalle_venta_url(detalle_venta, format: :json)
