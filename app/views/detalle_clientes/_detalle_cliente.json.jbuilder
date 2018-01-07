json.extract! detalle_cliente, :id, :cuenta_cliente_id, :usuario_id, :detalle, :monto, :created_at, :updated_at
json.url detalle_cliente_url(detalle_cliente, format: :json)
