# frozen_string_literal: true

class Article < ApplicationRecord
  # Concerns
  # Sortable position
  include SortablePosition

  # Relationships
  # Publication
  belongs_to :publication
  # Unions
  has_one :union, as: :member, dependent: :destroy
  accepts_nested_attributes_for :union

  # Validations
  validates :title, presence: true

  # Class Methods
end
