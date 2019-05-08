# frozen_string_literal: true

module Members
  extend ActiveSupport::Concern
  included do
    def create_member(object = "")
      order = Union.pluck(:position).compact
      order << 0
      Union.create(
        member_type: object.class.name,
        member_id: object.id,
        position: order.min - 1
      )
    end
  end
end
