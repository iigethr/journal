# frozen_string_literal: true

class CreateTexts < ActiveRecord::Migration[6.0]
  def change
    create_table :texts do |t|
      t.string      :slug, unique: true, index: true
      t.references  :article, foreign_key: true
      t.text        :body
      t.integer     :position

      t.timestamps
    end
  end
end
