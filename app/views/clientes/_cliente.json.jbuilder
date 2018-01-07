json.extract! cliente, :id, :negocio_id, :nombre, :direccion, :telefono, :email, :created_at, :updated_at
json.url cliente_url(cliente, format: :json)
