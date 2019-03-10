# frozen_string_literal: true

json.extract! publication, :id, :user_id, :title, :description, :published, :created_at, :updated_at
json.url publication_url(publication, format: :json)
