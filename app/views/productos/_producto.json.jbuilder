json.extract! producto, :id, :codigo, :descripcion, :stock, :minimo, :unidad, :precio, :costo, :negocio_id, :proveedor_id, :created_at, :updated_at
json.url producto_url(producto, format: :json)
