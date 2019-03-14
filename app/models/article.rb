# frozen_string_literal: true

class Article < ApplicationRecord
  # Relationships
  belongs_to :publication
end
