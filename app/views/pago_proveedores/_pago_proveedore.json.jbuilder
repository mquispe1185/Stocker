json.extract! pago_proveedore, :id, :cuenta_proveedor_id, :monto, :usuario_id, :observacion, :created_at, :updated_at
json.url pago_proveedore_url(pago_proveedore, format: :json)
