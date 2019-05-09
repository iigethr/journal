# frozen_string_literal: true

class CreatePasskeys < ActiveRecord::Migration[6.0]
  def change
    create_table :passkeys do |t|
      t.string      :slug,        default: "", null: false, unique: true, index: true
      t.references  :user,        null: false, foreign_key: true, index: true
      t.references  :publication, null: false, foreign_key: true, index: true
      t.boolean     :active,      default: false
      t.string      :role,        default: "collaborator"
      t.string      :email
      t.string      :token

      t.timestamps
    end
  end
end
