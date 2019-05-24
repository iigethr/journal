# frozen_string_literal: true

class ArticlesController < ApplicationController
  # Concerns
  include Members
  include Passkeys

  # Callbacks
  before_action :publication
  before_action :passkey

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
      create_member(@article)
      flash[:notice] = "Article was successfully created."
      redirect_to publication_article_path(@publication, @article)
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
      redirect_to publication_article_path(@publication, @article)
    else
      render :edit
    end
  end

  def destroy
    @article.destroy
    flash[:notice] = "Article was successfully destroyed."
    redirect_to publication_articles_path(@publication)
  end

  private

  def publication
    @publication = Publication.find_by(slug: params[:publication_id])
  end

  def article
    @article = @publication.articles.find_by(slug: params[:id])
  end

  def agents
    @agents = Agent.includes(act: :rich_text_body ).where(union_id: @article.union).order(position: :asc)
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
