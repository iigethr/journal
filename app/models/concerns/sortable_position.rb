# frozen_string_literal: true

module SortablePosition
  extend ActiveSupport::Concern
  module ClassMethods
    # Sort Position
    def sort_position(fetch_position)
      fetch_position.each_with_index do |id, index|
        object = where(id: id)
        # object.update_attribute(:position, index + 1)
        object.update_all(position: index + 1)
      end
    end
  end
end
