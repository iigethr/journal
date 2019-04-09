# frozen_string_literal: true

json.extract! profile, :id, :user_id, :name, :middle_name, :last_name, :created_at, :updated_at
json.url profile_url(profile, format: :json)
