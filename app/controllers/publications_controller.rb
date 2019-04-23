# frozen_string_literal: true

class PublicationsController < ApplicationController
  # Callbacks
  before_action :publications, only: [:index]
  before_action :publication, only: [:show, :edit, :update, :destroy, :preview]
  before_action :articles, only: [:show, :preview]

  # Layout
  layout "application_preview", only: [:preview]

  def index
  end

  def show
  end

  def preview
  end

  def edit
    redirect_to publication_path(publication)
  end

  def update
    if @publication.update(publication_params)
      flash[:notice] = "Publication was successfully updated."
      redirect_to @publication
    else
      render :edit
    end
  end

  def destroy
    @publication.destroy
    flash[:notice] = "Publication was successfully destroyed."
    redirect_to publications_url
  end

  def new
    @publication = Publication.new
  end

  def create
    order = Publication.pluck(:position).compact
    @publication = Publication.new(publication_params)
    order << 0
    @publication.position = (order.min - 1)

    if @publication.save
      flash[:notice] = "Publication was successfully created."
      redirect_to publication_path(@publication)
    else
      render :new
    end
  end

  def sortable
    Publication.sort_position(params[:publication])
    head :ok
  end

  private

  def publications
    @publications ||= Publication.includes(:user, :articles).order(position: :asc)
  end

  def publication
    @publication = Publication.find_by(slug: params[:id])
  end

  def articles
    @articles = @publication.articles.order(position: :asc)
  end

  def publication_params
    params.require(:publication).permit(
      :user_id,
      :title,
      :description,
      :published,
      :position
    )
  end
end
