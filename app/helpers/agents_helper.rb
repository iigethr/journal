# frozen_string_literal: true

module AgentsHelper
  # Render agent
  def render_agent(parent, asset)
    if asset.agent.piece?
      render "lib/agents/piece", parent: parent, asset: asset
    elsif asset.agent.picture?
      render "lib/agents/picture", parent: parent, asset: asset
    else
      "Oops! Something went wrong."
    end
  end

  # Render preview agent
  def render_preview_agent(object)
    if object.text?
      render "lib/agents/preview/text", text: object.act, agent: object
    elsif object.picture?
      render "lib/agents/preview/picture", picture: object.act, agent: object
    elsif object.video?
      object.act.try(:caption)
    elsif object.document?
      object.act.try(:caption)
    end
  end
end
