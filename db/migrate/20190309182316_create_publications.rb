# frozen_string_literal: true

class CreatePublications < ActiveRecord::Migration[6.0]
  def change
    create_table :publications do |t|
      t.string      :slug, default: "", null: false, unique: true, index: true
      t.string      :title
      t.text        :description
      t.boolean     :published, default: false
      t.integer     :position
      # Access
      t.string      :access_id, default: "", null: false, unique: true, index: true
      t.string      :access_token, default: "", null: false, unique: true, index: true

      t.timestamps
    end
  end
end
