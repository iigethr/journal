# frozen_string_literal: true

class Union < ApplicationRecord
  # Concerns
  # ----------------------------------------------------

  include SortablePosition

  # Relationships
  # ----------------------------------------------------

  belongs_to :member, polymorphic: true
  has_many :agents, dependent: :destroy
  accepts_nested_attributes_for :agents

  # Validations
  # ----------------------------------------------------

  # Class Methods
  # ----------------------------------------------------

  # Callbacks
  # ----------------------------------------------------

  before_create :set_position
end
