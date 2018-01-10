json.extract! detalle_cierre, :id, :cierre_id, :descripcion, :monto, :created_at, :updated_at
json.url detalle_cierre_url(detalle_cierre, format: :json)
