# frozen_string_literal: true

json.extract! video, :id, :caption, :created_at, :updated_at
json.url video_url(video, format: :json)
