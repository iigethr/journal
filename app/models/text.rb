# frozen_string_literal: true

class Text < ApplicationRecord
  # Relationships
  # Article
  belongs_to :article
  # Agents
  has_many :agents, as: :act, dependent: :destroy
  accepts_nested_attributes_for :agents

  # Trix
  has_rich_text :body
end
