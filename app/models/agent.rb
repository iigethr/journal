# frozen_string_literal: true

class Agent < ApplicationRecord
  # Concerns
  # Sortable position
  include SortablePosition

  # Relationships
  # Act
  belongs_to :act, polymorphic: true
  belongs_to :union

  # Validations

  # Class Methods
  def piece?
    act_type == "Piece"
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
