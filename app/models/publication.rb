# frozen_string_literal: true

class Publication < ApplicationRecord
  # Relationships
  belongs_to :user
  has_many :articles, dependent: :destroy

  # Class Methods
  accepts_nested_attributes_for :articles
end
