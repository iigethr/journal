# frozen_string_literal: true

class PublicationsController < ApplicationController
  before_action :set_publication, only: [:show, :edit, :update, :destroy]

  def index
    @publications = Publication.includes(:user).all
  end

  def show
  end

  def new
    @publication = Publication.new
  end

  def edit
  end

  def create
    @publication = Publication.new(publication_params)

    if @publication.save
      flash[:notice] = "Publication was successfully created."
      redirect_to publication_path(@publication)
    else
      render :new
    end
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

  private

  def set_publication
    @publication = Publication.find(params[:id])
  end

  def publication_params
    params.require(:publication).permit(
      :user_id,
      :title,
      :description,
      :published
    )
  end
end
