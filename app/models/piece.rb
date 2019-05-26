# frozen_string_literal: true

class Piece < ApplicationRecord
  # Relationships
  # Agents
  has_one :agent, as: :act, dependent: :destroy
  accepts_nested_attributes_for :agent

  # Trix
  has_rich_text :body
end
