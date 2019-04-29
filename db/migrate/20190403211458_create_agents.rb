# frozen_string_literal: true

class CreateAgents < ActiveRecord::Migration[6.0]
  def change
    create_table :agents do |t|
      t.string      :slug, default: "", null: false, unique: true, index: true
      t.references  :article, foreign_key: true
      t.references  :act, polymorphic: true, index: true
      t.integer     :position

      t.timestamps
    end
  end
end
