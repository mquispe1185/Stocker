json.extract! gasto, :id, :descripcion, :categoria_id, :usuario_id, :negocio_id, :monto, :created_at, :updated_at
json.url gasto_url(gasto, format: :json)
