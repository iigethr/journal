# frozen_string_literal: true

module Acts
  extend ActiveSupport::Concern
  included do
    def create_agent(parent = "", object = "")
      order = parent.agents.pluck(:position).compact
      order << 0
      Agent.create(
        article_id: parent.id,
        act_type: object.class.name,
        act_id: object.id,
        position: order.min - 1
      )
    end
  end
end
