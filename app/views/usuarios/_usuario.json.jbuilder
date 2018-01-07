json.extract! usuario, :id, :usuario, :password_digest, :nombre, :negocio_id, :rol, :created_at, :updated_at
json.url usuario_url(usuario, format: :json)
