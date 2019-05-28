# frozen_string_literal: true

module Publications
  extend ActiveSupport::Concern
  included do
    def order_list(records)
      order = records.pluck(:position).compact
      order << 0
      records.position = (order.min - 1)
    end
  end
end
