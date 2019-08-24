# frozen_string_literal: true

class ArticlesController < ApplicationController
  # Concerns
  # --------

  include Passkeys
  include Unions

  # Callbacks
  before_action :journal
  before_action :passkey

  before_action :article, only: [:show, :edit, :update, :destroy, :preview]
  before_action :agents, only: [:show, :preview]

  # Layout
  layout "application_preview", only: [:preview]

  def index
    @articles = @journal.articles.order(position: :asc)
  end

  def sortable
    @journal.articles.sort_position(params[:article])
    head :ok
  end

  def new
    @article = @journal.articles.new
  end

  def create
    order = @journal.articles.pluck(:position).compact
    @article = @journal.articles.new(article_params)
    order << 0
    @article.position = (order.min - 1)

    if @article.save
      create_union(@article)
      flash[:notice] = "Article was successfully created."
      redirect_to journal_article_path(@journal, @article)
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
      redirect_to journal_article_path(@journal, @article)
    else
      render :edit
    end
  end

  def destroy
    @article.destroy
    flash[:notice] = "Article was successfully destroyed."
    redirect_to journal_articles_path(@journal)
  end

  private

  def journal
    @journal = journal.find_by(slug: params[:journal_id])
  end

  def article
    @article = @journal.articles.find_by(slug: params[:id])
  end

  def agents
    @agents = Agent.where(union_id: @article.union).order(position: :asc).all
    @assets = []
    @agents.each do |agent|
      if agent.act_type == "Picture"
        asset = Picture.where(id: agent.act_id)
      elsif agent.act_type == "Piece"
        asset = Piece.where(id: agent.act_id)
      end
      @assets += asset if asset
    end
  end

  def article_params
    params.require(:article).permit(
      :journal_id,
      :title,
      :description,
      :published,
      :position
    )
  end
end
