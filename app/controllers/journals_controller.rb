# frozen_string_literal: true

class JournalsController < ApplicationController
  # Concerns
  # --------
  include Passkeys

  # Callbacks
  # ---------
  before_action :journals,  only: [:index]
  before_action :journal,   only: [:show, :preview, :edit, :update, :destroy, :destroy_cover, :destroy_thumb]
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
    if @journal.update(journal_params)
      flash[:notice] = "Journal was successfully updated."
      redirect_to journal_path(@journal)
    else
      render :edit
    end
  end

  def destroy
    @journal.destroy
    flash[:notice] = "Journal was successfully destroyed."
    redirect_to journals_path
  end

  def destroy_cover
    @attachment = @journal.cover
    @attachment.purge
    flash[:notice] = "Journal cover was successfully destroyed."
    redirect_to edit_journal_path(@journal, cover: true)
  end

  def destroy_thumb
    @attachment = @journal.thumb
    @attachment.purge
    flash[:notice] = "Journal thumb was successfully destroyed."
    redirect_to edit_journal_path(@journal, thumb: true)
  end

  def sortable
    Journal.sort_position(params[:journal])
    head :ok
  end

  def new
    @journal = Journal.new
  end

  def create
    @journal = Journal.new(journal_params)

    if @journal.save
      Passkey.create(
        active: true,
        user_id: current_user.id,
        journal_id: @journal.id,
        role: "owner",
        email: current_user.email
      )

      flash[:notice] = "Journal was successfully created."
      redirect_to journal_path(@journal)
    else
      render :new
    end
  end

  private

  def journals
    get_passkeys = current_user.passkeys
    set_journals = []

    get_passkeys.each do |passkey|
      get_journals = Journal.where(id: passkey.journal_id)
      set_journals += get_journals if get_journals

      @journals = set_journals.sort_by(&:position)
      @passkey = passkey
    end
  end

  def journal
    @journal = Journal.find_by(slug: params[:id])
  end

  def articles
    # @articles = @journal.articles.order(position: :asc)

    @articles = []
    get_articles = Article.includes(:union).where(journal_id: @journal.id)
    @articles += get_articles if get_articles
    @article_agents = []
    @articles.each do |article|
      get_article_agents = article.union.agents.includes(:act).order(position: :asc).all
      @article_agents += get_article_agents if get_article_agents
    end
  end

  def sections
    # @sections = @journal.sections.order(position: :asc)

    @sections = []
    get_sections = Section.includes(:union).where(journal_id: @journal.id)
    @sections += get_sections if get_sections
    @section_agents = []
    @sections.each do |section|
      get_section_agents = section.union.agents.includes(:act).order(position: :asc).all
      @section_agents += get_section_agents if get_section_agents
    end
  end

  def journal_params
    params.require(:journal).permit(
      :title,
      :description,
      :published,
      :position,
      :cover,
      :thumb
    )
  end
end
