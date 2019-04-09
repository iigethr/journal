# frozen_string_literal: true

json.extract! text, :id, :body, :position, :created_at, :updated_at
json.url text_url(text, format: :json)
