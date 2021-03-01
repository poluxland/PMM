# frozen_string_literal: true

json.extract! checklist, :id, :nombre, :fecha, :cinta, :lubricacion, :aseos, :nivel, :fugas, :presion, :filtro1,
              :filtro2, :polvo, :raspador, :iluminacion, :comentarios, :created_at, :updated_at
json.url checklist_url(checklist, format: :json)
