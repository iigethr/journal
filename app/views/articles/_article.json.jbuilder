# frozen_string_literal: true

json.extract! article, :id, :publication_id, :title, :description, :published, :position, :created_at, :updated_at
json.url publication_article_url(@publication, article, format: :json)
