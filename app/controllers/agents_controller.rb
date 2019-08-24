# frozen_string_literal: true

class AgentsController < ApplicationController
  # Concerns
  # --------

  include Agents
  include Passkeys

  # Helpers
  # -------

  include ParentsHelper
  include AgentsHelper

  # Callbacks
  # ---------

  before_action :journal
  before_action :passkey
  before_action :parent
  before_action :agents

  # Methods
  # -------

  def index
    redirect_to parent_url(@parent)
  end

  def show
    redirect_to parent_url(@parent)
  end

  def sortable
    agents.sort_position(params[:agent])
    head :ok
  end

  private

  def journal
    @journal =
      if (params[:journal_id] && params[:article_id]) || (params[:journal_id] && params[:section_id])
        journal.find_by(slug: params[:journal_id])
      else
        parent
        @parent.journal
      end
  end

  def parent
    @parent =
      if params[:article_id]
        Article.find_by(slug: params[:article_id])
      elsif params[:section_id]
        Section.find_by(slug: params[:section_id])
      end
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
