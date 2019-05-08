# frozen_string_literal: true

class Union < ApplicationRecord
  # Concerns
  # Sortable position
  include SortablePosition

  # Relationships
  # Agents
  has_many :agents
  accepts_nested_attributes_for :agents
  # Member
  belongs_to :member, polymorphic: true

  # Validations

  # Class Methods
end
