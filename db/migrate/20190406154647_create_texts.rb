# frozen_string_literal: true

class CreateTexts < ActiveRecord::Migration[5.2]
  def change
    create_table :texts do |t|
      t.string  :slug, unique: true, index: true
      t.text    :body
      t.integer :position

      t.timestamps
    end
  end
end
