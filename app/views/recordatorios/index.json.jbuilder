json.array!(@recordatorios) do |recordatorio|
  json.extract! recordatorio, :id, :user_id, :fecha_prestamo, :fecha_entrega, :contacto, :concepto, :detalle, :regresado, :lat, :long
  json.url recordatorio_url(recordatorio, format: :json)
end