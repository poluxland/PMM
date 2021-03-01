# frozen_string_literal: true

json.extract! truck, :id, :fecha, :mmpp_id, :tipo, :llegada, :llamada, :salida, :created_at, :updated_at, :patente,
              :wait, :cause, :motive, :number, :other
json.url truck_url(truck, format: :json)
