# frozen_string_literal: true

class AgentsController < ApplicationController
  # Concerns
  include Acts
  include Passkeys

  # Callbacks
  before_action :parent
  before_action :agents

  def index
    redirect_to @parent
  end

  def show
    redirect_to @parent
  end

  def sortable
    agents.sort_position(params[:agent])
    head :ok
  end

  private

  def parent
    @parent =
      if params[:article_id]
        Article.find_by(slug: params[:article_id])
      elsif params[:section_id]
        Section.find_by(slug: params[:section_id])
      end
    publication  = Publication.where(id: @parent.publication_id).first
    passkey      = Passkey.where(publication_id: publication.id, user_id: current_user.id).first
    redirect_to root_path unless passkey
  end

  def agents
    @agents = Agent.where(union_id: @parent.union).order(position: :asc)
  end

  def agent_params
    params.require(:agent).permit(
      :position
    )
  end
end
