# frozen_string_literal: true

class CreateSections < ActiveRecord::Migration[6.0]
  def change
    create_table :sections do |t|
      t.string      :slug,        default: "", null: false, unique: true, index: true
      t.references  :publication, null: false, foreign_key: true, index: true
      t.string      :title
      t.text        :description
      t.boolean     :published,   default: false
      t.integer     :position

      t.timestamps
    end
  end
end
