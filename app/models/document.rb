# frozen_string_literal: true

class Document < ApplicationRecord
  # Relationships
  # Agents
  has_many :agents, as: :act, dependent: :destroy
  accepts_nested_attributes_for :agents

  # Active storage
  has_one_attached :upload
end
