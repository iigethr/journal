# frozen_string_literal: true

class Agent < ApplicationRecord
  # Relationships
  # Act
  belongs_to :act, polymorphic: true

  # Validations

  # Class Methods
  def text?
    act_type == "Text"
  end

  def picture?
    act_type == "Picture"
  end

  def video?
    act_type == "Video"
  end

  def document?
    act_type == "Document"
  end

  def gallery?
    act_type == "Gallery"
  end
end
