json.extract! negocio, :id, :nombre, :direccion, :telefono, :cuit, :alta, :expiracion_licencia, :validado, :admin_id, :created_at, :updated_at
json.url negocio_url(negocio, format: :json)
