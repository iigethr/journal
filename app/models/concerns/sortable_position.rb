# frozen_string_literal: true

module SortablePosition
  extend ActiveSupport::Concern

  def set_position
    klass = self.class.name
    order = klass.classify.constantize.pluck(:position).compact
    order << 0
    self.position = (order.min - 1)
  end

  module ClassMethods
    def sort_position(params)
      params.each_with_index do |id, index|
        object = where(id: id)
        object.update_all(position: index + 1)
      end
    end
  end
end
