json.extract! evaluacion, :id, :sector_id, :barrido, :orden, :derrames, :promedio, :comentarios, :created_at, :updated_at
json.url evaluacion_url(evaluacion, format: :json)
