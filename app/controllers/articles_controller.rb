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
    @agents = Agent.where(union_id: @article.union).order(position: :asc).all
  end

  def agents_rr
    @texts = Agent.includes(act: {picture: [:upload_attachment]}).includes(act: :rich_text_body).where(union_id: @article.union, act_type: "Text").all
    @set_pictures = Agent.where(union_id: @article.union, act_type: "Picture").all

    @pictures = Picture.where(id: @set_pictures)

    @set_agents = @texts + @pictures
    @agents = @set_agents.sort_by { |h| h[:position] }.reverse!
  end

  def agents_rrr
    @set_texts = Agent.where(union_id: @article.union, act_type: "Text").all
    @set_pictures = Agent.where(union_id: @article.union, act_type: "Picture").all

    @texts = []
    @set_texts.each do |text|
      get_texts = Text.where(id: text.act_id)
      @texts += get_texts if get_texts
    end

    @pictures = []
    @set_pictures.each do |picture|
      get_pictures = Picture.where(id: picture.act_id)
      @pictures += get_pictures if get_pictures
    end

    @set_agents = @texts + @pictures
    @agents = @set_agents.sort_by { |h| h["agents.position"] }.reverse!
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
