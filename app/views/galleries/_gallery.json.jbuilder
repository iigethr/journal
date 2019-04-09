# frozen_string_literal: true

json.extract! gallery, :id, :caption, :position, :created_at, :updated_at
json.url gallery_url(gallery, format: :json)
