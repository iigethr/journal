# frozen_string_literal: true

class GalleriesController < ApplicationController
  # Callbacks
  before_action :set_article
  before_action :set_gallery, only: [:show, :edit, :update, :destroy]

  def index
    @galleries = Gallery.all
  end

  def show
  end

  def edit
  end

  def update
    if @gallery.update(gallery_params)
      flash[:notice] = "Gallery was successfully updated."
      redirect_to @gallery
    else
      render :edit
    end
  end

  def destroy
    @gallery.destroy
    flash[:notice] = "Gallery was successfully destroyed."
    redirect_to galleries_url
  end

  def new
    @gallery = Gallery.new
  end

  def create
    @gallery = Gallery.new(gallery_params)

    if @gallery.save
      create_agent(@article, @gallery)
      flash[:notice] = "Gallery was successfully created."
      redirect_to @gallery
    else
      render :new
    end
  end

  private

  def set_article
    @article = Article.find_by(id: params[:article_id])
  end

  def set_gallery
    @gallery = Gallery.find(params[:id])
  end

  def gallery_params
    params.require(:gallery).permit(
      :label,
      :caption,
      :position
    )
  end
end
