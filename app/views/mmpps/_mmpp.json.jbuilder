# frozen_string_literal: true

json.extract! mmpp, :id, :nombre, :descripcion, :densidad, :created_at, :updated_at
json.url mmpp_url(mmpp, format: :json)
