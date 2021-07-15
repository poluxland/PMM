json.extract! tarea, :id, :descripcion, :criticidad, :otros, :created_at, :updated_at
json.url tarea_url(tarea, format: :json)
