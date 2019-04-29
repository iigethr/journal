# frozen_string_literal: true

class CreatePublicationSettings < ActiveRecord::Migration[6.0]
  def change
    create_table :publication_settings do |t|
      t.string      :slug, default: "", null: false, unique: true, index: true
      t.references  :user, foreign_key: true

      t.timestamps
    end
  end
end
