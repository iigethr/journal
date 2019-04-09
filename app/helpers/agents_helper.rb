# frozen_string_literal: true

module AgentsHelper
  def render_agent(object = "")
    image_tag "https://via.placeholder.com/960x540/0000FF/808080 ?Text=BonjourGramme.com" if object.picture?
  end
end
