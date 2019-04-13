# frozen_string_literal: true

class PicturesController < ApplicationController
  # Concerns
  include Act

  # Callbacks
  before_action :set_article
  before_action :set_picture, only: [:show, :edit, :update, :destroy]

  def index
    redirect_to article_path(@article)
    # @pictures = Picture.all
    # @agents = Agent.where(article_id: @article.id, act: @pictures)
  end

  def show
  end

  def edit
  end

  def update
    if @picture.update(picture_params)
      flash[:notice] = "Picture was successfully updated."
      redirect_to @picture
    else
      render :edit
    end
  end

  def destroy
    @picture.destroy
    flash[:notice] = "Picture was successfully destroyed."
    redirect_to pictures_url
  end

  def new
    @picture = Picture.new
  end

  def create
    @picture = Picture.new(picture_params)

    if @picture.save
      create_agent(@article, @picture)
      flash[:notice] = "Picture was successfully created."
      redirect_to article_picture_path(@article, @picture)
    else
      render :new
    end
  end

  private

  def set_article
    @article = Article.find_by(slug: params[:article_id])
  end

  def set_picture
    @picture = Picture.find_by(slug: params[:id])
  end

  def picture_params
    params.require(:picture).permit(
      :caption,
      :upload
    )
  end
end
