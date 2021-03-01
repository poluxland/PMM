# frozen_string_literal: true

json.extract! registro, :id, :cancha_id, :uso, :fotografia, :created_at, :updated_at
json.url registro_url(registro, format: :json)
