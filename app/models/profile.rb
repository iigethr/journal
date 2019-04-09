# frozen_string_literal: true

class Profile < ApplicationRecord
  # Relationships
  # User
  belongs_to :user

  # Class Methods
  has_person_name
end
