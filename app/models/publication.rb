# frozen_string_literal: true

class Publication < ApplicationRecord
  # Concerns
  # Sortable position
  include SortablePosition

  # Relationships
  # User
  belongs_to :user
  # Articles
  has_many :articles, dependent: :destroy
  accepts_nested_attributes_for :articles

  # Validations
  validates :title, presence: true

  # Class Methods
end
