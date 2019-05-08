# frozen_string_literal: true

class CreateProfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :profiles do |t|
      t.string      :slug, default: "", null: false, unique: true, index: true
      t.references  :user, null: false, foreign_key: true, index: true
      t.string      :first_name
      t.string      :middle_name
      t.string      :last_name

      t.timestamps
    end
  end
end
