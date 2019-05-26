# frozen_string_literal: true

class CreatePieces < ActiveRecord::Migration[6.0]
  def change
    create_table :pieces do |t|
      t.string      :slug, default: "", null: false, unique: true, index: true
      t.string      :label
      t.text        :body
      t.integer     :position

      t.timestamps
    end
  end
end
