# frozen_string_literal: true

class CreateArticles < ActiveRecord::Migration[5.2]
  def change
    create_table :articles do |t|
      t.references :publication, foreign_key: true, index: true
      t.string :title
      t.text :description
      t.boolean :published, default: false
      t.integer :position

      t.timestamps
    end
  end
end