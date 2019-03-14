# frozen_string_literal: true

class ArticlesController < ApplicationController
  before_action :set_publication
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  def index
    @articles = @publication.articles.all
  end

  def show
  end

  def new
    @article = @publication.articles.new
  end

  def edit
  end

  def create
    @article = @publication.articles.new(article_params)

    if @article.save
      flash[:notice] = "Article was successfully created."
      redirect_to publication_article_path(@publication, @article)
    else
      render :new
    end
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

  def set_publication
    @publication = Publication.find_by(id: params[:publication_id])
  end

  def set_article
    @article = @publication.articles.find(params[:id])
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
