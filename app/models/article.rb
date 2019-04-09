# frozen_string_literal: true

class Article < ApplicationRecord
  # Relationships
  # Publication
  belongs_to :publication
  accepts_nested_attributes_for :publication
  # Agents
  has_many :agents, dependent: :destroy
  accepts_nested_attributes_for :agents

  # Validations
  validates :title, presence: true

  # Class Methods
end
