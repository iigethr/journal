class SectionsController < ApplicationController
  # Concerns
  include Passkeys

  # Callbacks
  before_action :section, only: [:show, :edit, :update, :destroy]
  before_action :publication
  before_action :passkey

  def index
    @sections = @publication.sections.order(position: :asc)
  end

  def sortable
    @publication.sections.sort_position(params[:section])
    head :ok
  end

  # GET /sections/1
  # GET /sections/1.json
  def show
  end

  # GET /sections/new
  def new
    @section = Section.new
  end

  # GET /sections/1/edit
  def edit
  end

  # POST /sections
  # POST /sections.json
  def create
    @section = Section.new(section_params)

    respond_to do |format|
      if @section.save
        format.html { redirect_to @section, notice: 'Section was successfully created.' }
        format.json { render :show, status: :created, location: @section }
      else
        format.html { render :new }
        format.json { render json: @section.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sections/1
  # PATCH/PUT /sections/1.json
  def update
    respond_to do |format|
      if @section.update(section_params)
        format.html { redirect_to @section, notice: 'Section was successfully updated.' }
        format.json { render :show, status: :ok, location: @section }
      else
        format.html { render :edit }
        format.json { render json: @section.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sections/1
  # DELETE /sections/1.json
  def destroy
    @section.destroy
    respond_to do |format|
      format.html { redirect_to sections_url, notice: 'Section was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def section
    # Find the child
    @section = Section.find_by(slug: params[:id])
    # Childs parent
    publication = Publication.where(id: @section.publication_id).first
    redirect_to root_path if publication.user_id != current_user.id
  end

  def publication
    @publication =
      if params[:publication_id]
        current_user.publications.find_by(slug: params[:publication_id])
      else
        @section.publication
      end
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def section_params
    params.require(:section).permit(:slug, :publication_id, :title, :description, :published, :position)
  end
end
