# frozen_string_literal: true

module AgentsHelper
  # Render agent
  def render_agent(parent, act)
    if act.text?
      render "lib/agents/text", parent: parent, agent: agent, act: agent.act
    elsif agent.picture?
      render "lib/agents/picture", parent: parent, agent: agent, act: agent.act
    elsif agent.video?
      render "lib/agents/video", parent: parent, agent: agent, act: agent.act
    elsif agent.document?
      render "lib/agents/document", parent: parent, agent: agent, act: agent.act
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
