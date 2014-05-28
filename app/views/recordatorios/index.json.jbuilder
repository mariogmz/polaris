json.array!(@recordatorios) do |recordatorio|
  json.extract! recordatorio, :user_id, :fecha_prestamo, :fecha_entrega, :contacto, :concepto, :detalle, :regresado
  json.url recordatorio_url(recordatorio, format: :json)
end