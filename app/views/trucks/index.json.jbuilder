# frozen_string_literal: true

json.array! @trucks, partial: 'trucks/truck', as: :truck
