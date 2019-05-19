# frozen_string_literal: true

class PublicationsController < ApplicationController
  # Concerns
  include Tokens
  include Passkeys

  # Callbacks
  before_action :publication,   except: [:index, :new, :create, :sortable]
  before_action :articles,      only:   [:preview, :toc]
  before_action :sections,      only:   [:preview, :toc]
  before_action :passkey,       only:   [:show, :edit, :update, :destroy, :preview, :toc]

  # Layouts
  layout "application_preview", only: [:preview, :toc]

  # Methods
  def index
    # @publications = Publication.all
    publications
  end

  def show
  end

  def preview
    # options = {}
    # options[:include] = [:articles, :sections, :union, :agents]
    # render json: PublicationSerializer.new(@publication, options).serialized_json
  end

  def toc
  end

  def edit
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
    redirect_to publications_path
  end

  def destroy_cover
    @attachment = @publication.cover
    @attachment.purge
    redirect_to edit_publication_path(@publication, cover: true)
  end

  def destroy_thumb
    @attachment = @publication.thumb
    @attachment.purge
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
    order_publication(@publication)

    if @publication.save
      create_passkey(current_user, @publication)
      flash[:notice] = "Publication was successfully created."
      redirect_to publication_path(@publication)
    else
      render :new
    end
  end

  private

  def publications
    @passkeys = current_user.passkeys
    @publications = []
    @passkeys.each do |passkey|
      get_publications = Publication.where(id: passkey.publication_id)
      @publications += get_publications if get_publications
      @passkey = passkey
    end
  end

  def publication
    @publication = Publication.find_by(slug: params[:id])

    @articles = []
    get_articles = Article.includes(:union).where(publication_id: @publication.id)
    @articles += get_articles if get_articles

    @article_agents = []
    @articles.each do |article|
      get_article_agents = article.union.agents.includes(:act).order(position: :asc).all
      @article_agents += get_article_agents if get_article_agents
    end

    @sections = []
    get_sections = Section.includes(:union).where(publication_id: @publication.id)
    @sections += get_sections if get_sections

    @section_agents = []
    @sections.each do |section|
      get_section_agents = section.union.agents.includes(:act).order(position: :asc).all
      @section_agents += get_section_agents if get_section_agents
    end
  end

  def articles
    @articles = @publication.articles.order(position: :asc)
  end

  def sections
    @sections = @publication.sections.order(position: :asc)
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
