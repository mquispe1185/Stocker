json.extract! pedido, :id, :usuario_id, :proveedor_id, :negocio_id, :created_at, :updated_at
json.url pedido_url(pedido, format: :json)
