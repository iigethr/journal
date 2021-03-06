# frozen_string_literal: true

class Picture < ApplicationRecord
  # Relationships
  # Agents
  has_one :agent, as: :act, dependent: :destroy
  accepts_nested_attributes_for :agent

  # Active storage
  has_one_attached :upload
end
