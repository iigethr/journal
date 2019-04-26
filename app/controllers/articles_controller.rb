# frozen_string_literal: true

class ArticlesController < ApplicationController
  # Callbacks
  before_action :publication, only: [:index, :new, :create, :sortable]
  before_action :article, only: [:show, :edit, :update, :destroy, :preview]
  before_action :agents, only: [:show, :preview]

  # Layout
  layout "application_preview", only: [:preview]

  def index
    @articles = @publication.articles.order(position: :asc)
  end

  def sortable
    @publication.articles.sort_position(params[:article])
    head :ok
  end

  def new
    @article = @publication.articles.new
  end

  def create
    order = @publication.articles.pluck(:position).compact
    @article = @publication.articles.new(article_params)
    order << 0
    @article.position = (order.min - 1)

    if @article.save
      flash[:notice] = "Article was successfully created."
      redirect_to article_path(@article)
    else
      render :new
    end
  end

  def show
  end

  def preview
  end

  def edit
  end

  def update
    if @article.update(article_params)
      flash[:notice] = "Article was successfully updated."
      redirect_to article_path(@article)
    else
      render :edit
    end
  end

  def destroy
    @article.destroy
    flash[:notice] = "Article was successfully destroyed."
    redirect_to publication_articles_path(@publication)
  end

  # def sortable_agent
  #   @agents.sort_position(params[:agent_id])
  #   head :ok
  # end

  private

  def publication
    @publication = current_user.publications.find_by(slug: params[:publication_id])
  end

  def article
    # Find the child
    @article = Article.find_by(slug: params[:id])
    # Childs parent
    publication = Publication.where(id: @article.publication_id).first
    redirect_to root_path if publication.user_id != current_user.id
  end

  def agents
    @agents = @article.agents.order(position: :asc)
  end

  def article_params
    params.require(:article).permit(
      :publication_id,
      :title,
      :description,
      :published,
      :position
    )
  end
end
