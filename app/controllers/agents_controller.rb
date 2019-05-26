# frozen_string_literal: true

class AgentsController < ApplicationController
  # Concerns
  # --------

  include Acts
  # include Passkeys

  # Helpers
  # -------

  include ParentsHelper
  include AgentsHelper

  # Callbacks
  # ---------

  before_action :publication
  # before_action :passkey
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

  def publication
    @publication = Publication.find_by(slug: params[:publication_id])
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
