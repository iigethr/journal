# frozen_string_literal: true

class SectionsController < ApplicationController
  # Concerns
  # --------

  include Passkeys
  include Unions

  # Callbacks
  before_action :journal
  before_action :passkey

  before_action :section, only: [:show, :preview, :edit, :update, :destroy]
  before_action :agents, only: [:show, :preview]

  def index
    @sections = @journal.sections.order(position: :asc)
  end

  def sortable
    @journal.sections.sort_position(params[:section])
    head :ok
  end

  def show
  end

  def preview
  end

  def edit
  end

  def update
    if @section.update(section_params)
      flash[:notice] = "Section was successfully updated."
      redirect_to journal_section_path(@journal, @section)
    else
      render :edit
    end
  end

  def destroy
    @section.destroy
    flash[:notice] = "Section was successfully destroyed."
    redirect_to journal_sections_path(journal)
  end

  def new
    @section = Section.new
  end

  def create
    @section = Section.new(section_params)

    if @section.save
      Union.create(
        member_type: @section.class.name,
        member_id: @section.id
      )

      flash[:notice] = "Section was successfully created."
      redirect_to journal_section_path(@journal, @section)
    else
      render :new
    end
  end

  private

  def journal
    @journal = Journal.find_by(slug: params[:journal_id])
  end

  def section
    @section = @journal.sections.find_by(slug: params[:id])
  end

  def agents
    @agents = Agent.where(union_id: @section.union).order(position: :asc).all
    @assets = []
    @agents.each do |agent|
      if agent.act_type == "Picture"
        asset = Picture.where(id: agent.act_id)
      elsif agent.act_type == "Piece"
        asset = Piece.where(id: agent.act_id)
      end
      @assets += asset if asset
    end
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def section_params
    params.require(:section).permit(:slug, :journal_id, :title, :description, :published, :position)
  end
end
