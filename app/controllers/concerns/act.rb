# frozen_string_literal: true

module Act
  extend ActiveSupport::Concern
  included do
    def create_agent(parent = "", object = "")
      Agent.create(
        article_id: parent.id,
        act_type: object.class.name,
        act_id: object.id
      )
    end
  end
end
