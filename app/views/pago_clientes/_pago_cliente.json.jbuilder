json.extract! pago_cliente, :id, :cuenta_cliente_id, :monto, :usuario_id, :observacion, :created_at, :updated_at
json.url pago_cliente_url(pago_cliente, format: :json)
