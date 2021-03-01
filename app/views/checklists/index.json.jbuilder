# frozen_string_literal: true

json.array! @checklists, partial: 'checklists/checklist', as: :checklist
