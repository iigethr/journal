# frozen_string_literal: true

class CreatePasskeys < ActiveRecord::Migration[6.0]
  def change
    create_table :passkeys do |t|
      t.string      :slug, default: "", null: false, unique: true, index: true
      t.boolean     :active, default: false
      t.references  :user, foreign_key: true, unique: true, index: true
      t.references  :publication, foreign_key: true, unique: true, index: true
      t.string      :role, default: "collaborator"
      t.string      :email
      t.string      :token

      t.timestamps
    end
  end
end
