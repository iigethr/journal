# frozen_string_literal: true

class CreatePublications < ActiveRecord::Migration[5.2]
  def change
    create_table :publications do |t|
      t.references :user, foreign_key: true, index: true
      t.string :title
      t.text :description
      t.boolean :published, default: false

      t.timestamps
    end
  end
end
