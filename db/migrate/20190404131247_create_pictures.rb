# frozen_string_literal: true

class CreatePictures < ActiveRecord::Migration[6.0]
  def change
    create_table :pictures do |t|
      t.string  :slug, unique: true, index: true
      t.string  :caption
      t.integer :position

      t.timestamps
    end
  end
end
