# frozen_string_literal: true

class VideosController < ApplicationController
  # Callbacks
  before_action :article
  before_action :video, only: [:show, :edit, :update, :destroy]

  def index
    @videos = Video.all
  end

  def show
  end

  def edit
  end

  def update
    if @video.update(video_params)
      flash[:notice] = "Video was successfully updated."
      redirect_to article_video_path(@article, @video)
    else
      render :edit
    end
  end

  def destroy
    @video.destroy
    flash[:notice] = "Video was successfully destroyed."
    redirect_to article_videos_path(@article)
  end

  def new
    @video = Video.new
  end

  def create
    @video = Video.new(video_params)

    if @video.save
      create_agent(@article, @video)
      flash[:notice] = "Video was successfully created."
      redirect_to article_video_path(@article, @video)
    else
      render :new
    end
  end

  private

  def article
    @article = Article.find_by(slug: params[:article_id])
    # Childs parent
    publication = Publication.where(id: @article.publication_id).first
    redirect_to root_path if publication.user_id != current_user.id
  end

  def video
    @video = Video.find(params[:id])
  end

  def video_params
    params.require(:video).permit(
      :label,
      :caption,
      :position
    )
  end
end
