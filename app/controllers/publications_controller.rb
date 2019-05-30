# frozen_string_literal: true

class PublicationsController < ApplicationController
  # Concerns
  # --------
  include Passkeys

  # Callbacks
  # ---------
  before_action :publications,  only: [:index]
  before_action :publication,   only: [:show, :preview, :edit, :update, :destroy, :destroy_cover, :destroy_thumb]
  before_action :passkey,       only: [:show, :preview, :edit, :update, :destroy, :destroy_cover, :destroy_thumb]
  before_action :articles,      only: [:preview]
  before_action :sections,      only: [:preview]

  # Layouts
  # -------
  layout "application_preview", only: [:preview]

  def index
  end

  def show
  end

  def preview
  end

  def edit
  end

  def update
    if @publication.update(publication_params)
      flash[:notice] = "Publication was successfully updated."
      redirect_to publication_path(@publication)
    else
      render :edit
    end
  end

  def destroy
    @publication.destroy
    flash[:notice] = "Publication was successfully destroyed."
    redirect_to publications_path
  end

  def destroy_cover
    @attachment = @publication.cover
    @attachment.purge
    flash[:notice] = "Publication cover was successfully destroyed."
    redirect_to edit_publication_path(@publication, cover: true)
  end

  def destroy_thumb
    @attachment = @publication.thumb
    @attachment.purge
    flash[:notice] = "Publication thumb was successfully destroyed."
    redirect_to edit_publication_path(@publication, thumb: true)
  end

  def sortable
    Publication.sort_position(params[:publication])
    head :ok
  end

  def new
    @publication = Publication.new
  end

  def create
    @publication = Publication.new(publication_params)

    if @publication.save
      Passkey.create(
        active: true,
        user_id: current_user.id,
        publication_id: @publication.id,
        role: "owner",
        email: current_user.email
      )

      flash[:notice] = "Publication was successfully created."
      redirect_to publication_path(@publication)
    else
      render :new
    end
  end

  private

  def publications
    get_passkeys = current_user.passkeys
    set_publications = []

    get_passkeys.each do |passkey|
      get_publications = Publication.where(id: passkey.publication_id)
      set_publications += get_publications if get_publications

      @publications = set_publications.sort_by(&:position)
      @passkey = passkey
    end
  end

  def publication
    @publication = Publication.find_by(slug: params[:id])
  end

  def articles
    # @articles = @publication.articles.order(position: :asc)

    @articles = []
    get_articles = Article.includes(:union).where(publication_id: @publication.id)
    @articles += get_articles if get_articles
    @article_agents = []
    @articles.each do |article|
      get_article_agents = article.union.agents.includes(:act).order(position: :asc).all
      @article_agents += get_article_agents if get_article_agents
    end
  end

  def sections
    # @sections = @publication.sections.order(position: :asc)

    @sections = []
    get_sections = Section.includes(:union).where(publication_id: @publication.id)
    @sections += get_sections if get_sections
    @section_agents = []
    @sections.each do |section|
      get_section_agents = section.union.agents.includes(:act).order(position: :asc).all
      @section_agents += get_section_agents if get_section_agents
    end
  end

  def publication_params
    params.require(:publication).permit(
      :title,
      :description,
      :published,
      :position,
      :cover,
      :thumb
    )
  end
end
