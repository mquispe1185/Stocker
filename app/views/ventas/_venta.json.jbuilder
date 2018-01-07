json.extract! venta, :id, :ticket, :usuario_id, :fecha, :total, :created_at, :updated_at
json.url venta_url(venta, format: :json)
