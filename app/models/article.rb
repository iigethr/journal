# frozen_string_literal: true

class Article < ApplicationRecord
  # Concerns
  # Sortable position
  include SortablePosition

  # Relationships
  # Publication
  belongs_to :publication

  has_many :pictures
  accepts_nested_attributes_for :pictures
  has_many :texts
  accepts_nested_attributes_for :texts
  has_many :documents
  accepts_nested_attributes_for :documents
  has_many :galleries
  accepts_nested_attributes_for :galleries
  has_many :videos
  accepts_nested_attributes_for :videos
  # Agents
  has_many :agents, dependent: :destroy
  accepts_nested_attributes_for :agents

  # Validations
  validates :title, presence: true

  # Class Methods
end
