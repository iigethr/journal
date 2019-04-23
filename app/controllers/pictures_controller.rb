# frozen_string_literal: true

class PicturesController < ApplicationController
  # Concerns
  include Act

  # Callbacks
  before_action :article
  before_action :picture, only: [:show, :edit, :update, :destroy]

  def index
    redirect_to article_path(article)
  end

  def show
  end

  def edit
  end

  def update
    if picture.update(picture_params)
      flash[:notice] = "Picture was successfully updated."
      redirect_to article_picture_path(article)
    else
      render :edit
    end
  end

  def destroy
    picture.destroy
    flash[:notice] = "Picture was successfully destroyed."
    redirect_to article_path(article)
  end

  def new
    @picture = Picture.new
  end

  def create
    @picture = Picture.new(picture_params)

    if @picture.save
      create_agent(@article, @picture)
      flash[:notice] = "Picture was successfully created."
      redirect_to article_path(@article)
    else
      render :new
    end
  end

  private

  def article
    @article = Article.find_by(slug: params[:article_id])
  end

  def picture
    @picture = Picture.find_by(slug: params[:id])
  end

  def picture_params
    params.require(:picture).permit(
      :caption,
      :upload
    )
  end
end
