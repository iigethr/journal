# frozen_string_literal: true

class CreatePublications < ActiveRecord::Migration[6.0]
  def change
    create_table :publications do |t|
      t.string     :slug, unique: true, index: true
      t.references :user, foreign_key: true, index: true
      t.string     :title
      t.text       :description
      t.boolean    :published, default: false
      t.integer    :position

      t.timestamps
    end
  end
end
