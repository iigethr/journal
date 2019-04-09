# frozen_string_literal: true

class Video < ApplicationRecord
  # Relationships
  has_many :agents, as: :act, dependent: :destroy
  accepts_nested_attributes_for :agents
end
