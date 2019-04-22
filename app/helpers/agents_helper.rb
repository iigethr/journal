# frozen_string_literal: true

module AgentsHelper
  def render_agent(parent = "", object = "")
    if object.text?
      render "lib/agents/text", parent: parent, text: object.act, agent: object
    elsif object.picture?
      render "lib/agents/picture", parent: parent, picture: object.act, agent: object
    elsif object.video?
      object.act.try(:caption)
    elsif object.document?
      object.act.try(:caption)
    end
  end

  def render_preview_agent(parent = "", object = "")
    if object.text?
      render "lib/agents/preview/text", parent: parent, text: object.act, agent: object
    elsif object.picture?
      render "lib/agents/preview/picture", parent: parent, picture: object.act, agent: object
    elsif object.video?
      object.act.try(:caption)
    elsif object.document?
      object.act.try(:caption)
    end
  end
end
