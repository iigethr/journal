# frozen_string_literal: true

class SectionsController < ApplicationController
  # Concerns
  # --------

  include Passkeys
  include Unions

  # Callbacks
  before_action :section, only: [:show, :preview, :edit, :update, :destroy]
  before_action :publication
  before_action :passkey
  before_action :agents, only: [:show, :preview]

  def index
    @sections = @publication.sections.order(position: :asc)
  end

  def sortable
    @publication.sections.sort_position(params[:section])
    head :ok
  end

  def show
  end

  def preview
  end

  def edit
  end

  def update
    respond_to do |format|
      if @section.update(section_params)
        format.html { redirect_to @section, notice: "Section was successfully updated." }
        format.json { render :show, status: :ok, location: @section }
      else
        format.html { render :edit }
        format.json { render json: @section.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @section.destroy
    flash[:notice] = "Section was successfully destroyed."
    redirect_to publication_sections_path(publication)
  end

  def new
    @section = Section.new
  end

  def create
    @section = Section.new(section_params)

    if @section.save
      create_union(@section)
      flash[:notice] = "Section was successfully created."
      redirect_to section_path(@section)
    else
      render :new
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def section
    # Find the child
    @section = Section.find_by(slug: params[:id])

    publication  = Publication.where(id: @section.publication_id).first
    passkey      = Passkey.where(publication_id: publication.id, user_id: current_user.id).first
    redirect_to root_path unless passkey
  end

  def publication
    @publication =
      if params[:publication_id]
        Publication.find_by(slug: params[:publication_id])
      else
        @section.publication
      end
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
    params.require(:section).permit(:slug, :publication_id, :title, :description, :published, :position)
  end
end
