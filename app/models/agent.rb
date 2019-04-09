# frozen_string_literal: true

class Agent < ApplicationRecord
  # Relationships
  # Act
  belongs_to :act, polymorphic: true

  # Validations

  # Class Methods
  def picture?
    act_type == "Picture"
  end

  def video?
    act_type == "Video"
  end
end
