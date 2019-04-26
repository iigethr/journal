# frozen_string_literal: true

class Document < ApplicationRecord
  # Relationships
  # Article
  belongs_to :article
  # Agents
  has_many :agents, as: :act, dependent: :destroy
  accepts_nested_attributes_for :agents

  # Active storage
  has_one_attached :upload
end
