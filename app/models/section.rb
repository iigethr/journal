class Section < ApplicationRecord
  # Concerns
  # Sortable position
  include SortablePosition

  # Relationships
  # Publication
  belongs_to :publication
end
