# frozen_string_literal: true

class Union < ApplicationRecord
  # Concerns
  # Sortable position
  include SortablePosition

  # Relationships
  # Member
  belongs_to :member, polymorphic: true
  # Agents
  has_many :agents, dependent: :destroy
  accepts_nested_attributes_for :agents

  # Validations

  # Class Methods
end
