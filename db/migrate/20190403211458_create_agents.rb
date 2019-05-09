# frozen_string_literal: true

class CreateAgents < ActiveRecord::Migration[6.0]
  def change
    create_table :agents do |t|
      t.string      :slug,  default: "", null: false, unique: true, index: true
      t.references  :union, null: false, foreign_key: true, index: true
      t.references  :act,   null: false, polymorphic: true, index: false
      t.integer     :position

      t.timestamps
    end
  end
end
