json.extract! detalle_pedido, :id, :pedido_id, :producto_id, :cantidad, :created_at, :updated_at
json.url detalle_pedido_url(detalle_pedido, format: :json)
