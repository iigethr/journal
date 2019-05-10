# frozen_string_literal: true

class Union < ApplicationRecord
  # Concerns
  # Sortable position
  include SortablePosition

  # Relationships
  # Agents
  has_many :agents, dependent: :destroy
  accepts_nested_attributes_for :agents
  # Member
  belongs_to :member, polymorphic: true

  # Validations

  # Class Methods
end
