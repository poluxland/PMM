json.extract! mantenimiento, :id, :fecha_programada, :fecha_ejecucion, :area, :tarea, :clase, :departamento, :estado, :observacion, :created_at, :updated_at
json.url mantenimiento_url(mantenimiento, format: :json)
