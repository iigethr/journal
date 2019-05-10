# frozen_string_literal: true

class CreateGalleries < ActiveRecord::Migration[6.0]
  def change
    create_table :galleries do |t|
      t.string      :slug, default: "", null: false, unique: true, index: true
      t.string      :label
      t.string      :caption
      t.integer     :position

      t.timestamps
    end
  end
end
