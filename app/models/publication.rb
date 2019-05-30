# frozen_string_literal: true

class Publication < ApplicationRecord
  # Tokens
  has_secure_token :access_id
  has_secure_token :access_token

  # Concerns
  # Sortable position
  include SortablePosition

  # Relationships
  ## Passkeys
  has_many :passkeys, dependent: :destroy # :nullify
  has_many :users, through: :passkeys
  accepts_nested_attributes_for :passkeys
  # Articles
  has_many :articles, dependent: :destroy
  accepts_nested_attributes_for :articles
  # Sections
  has_many :sections, dependent: :destroy
  accepts_nested_attributes_for :sections

  # Validations
  validates :title, presence: true

  # Active storage
  has_one_attached :cover
  has_one_attached :thumb

  before_create :set_position
end
