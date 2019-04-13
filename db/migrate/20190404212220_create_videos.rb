# frozen_string_literal: true

class CreateVideos < ActiveRecord::Migration[5.2]
  def change
    create_table :videos do |t|
      t.string  :slug, unique: true, index: true
      t.string  :caption
      t.integer :position

      t.timestamps
    end
  end
end