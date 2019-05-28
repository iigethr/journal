# frozen_string_literal: true

module SortablePosition
  extend ActiveSupport::Concern
  module ClassMethods
    # Sort Position
    def sort_position(params)
      params.each_with_index do |id, index|
        object = where(id: id)
        object.update_all(position: index + 1)
      end
    end
  end
end
