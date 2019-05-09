# frozen_string_literal: true

class CreateUnions < ActiveRecord::Migration[6.0]
  def change
    create_table :unions do |t|
      t.string      :slug,    default: "", null: false, unique: true, index: true
      t.references  :member,  null: false, polymorphic: true, index: false
      t.integer     :position

      t.timestamps
    end
  end
end
