# frozen_string_literal: true

class Publication < ApplicationRecord
  # Relationships
  belongs_to :user
  has_many :articles, dependent: :destroy
  accepts_nested_attributes_for :articles

  # Validations
  validates :title, presence: true

  # Class Methods
end
