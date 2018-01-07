json.extract! cuenta_cliente, :id, :cliente_id, :monto_adeudado, :observacion, :created_at, :updated_at
json.url cuenta_cliente_url(cuenta_cliente, format: :json)
