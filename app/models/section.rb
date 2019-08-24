# frozen_string_literal: true

class Section < ApplicationRecord
  # Concerns
  # ----------------------------------------------------

  include SortablePosition

  # Relationships
  # ----------------------------------------------------

  belongs_to :journal
  has_one :union, as: :member, dependent: :destroy
  accepts_nested_attributes_for :union

  # Validations
  # ----------------------------------------------------

  validates :title, presence: true

  # Callbacks
  # ----------------------------------------------------
  before_create :set_position

  # Class Methods
end
