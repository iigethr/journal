# frozen_string_literal: true

class AgentsController < ApplicationController
  # Callbacks
  before_action :article
  before_action :agents

  def sortable
    agents.sort_position(params[:agent])
    head :ok
  end

  private

  def article
    @article = Article.find_by(slug: params[:article_id])
  end

  def agents
    @agents = @article.agents.all
  end

  def agent_params
    params.require(:agent).permit(
      :position
    )
  end
end
