# frozen_string_literal: true

json.extract! cancha, :id, :nombre, :descripcion, :capacidad, :operativa, :mmpp_id, :created_at, :updated_at
json.url cancha_url(cancha, format: :json)
