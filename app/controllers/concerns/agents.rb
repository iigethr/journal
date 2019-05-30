# frozen_string_literal: true

module Agents
  extend ActiveSupport::Concern
  included do
    def create_agent(parent, object)
      order = Agent.pluck(:position).compact
      order << 0
      Agent.create(
        union_id: parent.union.id,
        act_type: object.class.name,
        act_id: object.id,
        position: order.min - 1
      )
    end
  end
end
