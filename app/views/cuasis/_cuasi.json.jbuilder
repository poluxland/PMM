# frozen_string_literal: true

json.extract! cuasi, :id, :sitio, :fecha, :reporta, :potencial, :accion, :responsable, :estado, :created_at, :updated_at
json.url cuasi_url(cuasi, format: :json)
