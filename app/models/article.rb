# frozen_string_literal: true

class Article < ApplicationRecord
  # Relationships
  belongs_to :publication
  accepts_nested_attributes_for :publication

  # Validations
  validates :title, presence: true

  # Class Methods
end
