# frozen_string_literal: true

class Publication < ApplicationRecord
  # Concerns
  # Sortable position
  include SortablePosition

  # Relationships
  # User
  belongs_to :user
  ## Organization Passkeys
  ## NOTE: need to define if this will be nullified
  has_many :passkeys, dependent: :destroy # :nullify
  has_many :users, through: :passkeys
  accepts_nested_attributes_for :passkeys
  # Articles
  has_many :articles, dependent: :destroy
  accepts_nested_attributes_for :articles

  # Validations
  validates :title, presence: true

  # Active storage
  has_one_attached :cover
  has_one_attached :thumb
end
