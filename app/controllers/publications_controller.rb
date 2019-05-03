# frozen_string_literal: true

class PublicationsController < ApplicationController
  # Concerns
  include Tokens
  include Passkeys

  # Callbacks
  before_action :publications, only: [:index]

  before_action :publication, only: [
    :show,
    :edit,
    :update,
    :destroy,
    :destroy_cover,
    :destroy_thumb,
    :preview,
    :toc
  ]

  before_action :passkey, only: [:show, :edit, :update, :destroy, :preview, :toc]
  before_action :articles, only: [:show, :preview, :toc]

  # Layout
  layout "application_preview", only: [:preview, :toc]

  def index
  end

  def show
  end

  def preview
  end

  def toc
  end

  def edit
    # redirect_to publication_path(publication)
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

  def destroy_cover
    @attachment = @publication.cover
    @attachment.purge
    redirect_to edit_publication_path(@publication, cover: :true)
  end

  def destroy_thumb
    @attachment = @publication.thumb
    @attachment.purge
    redirect_to edit_publication_path(@publication, thumb: :true)
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
      @passkey = Passkey.create(
        active: true,
        user_id: current_user.id,
        publication_id: @publication.id,
        role: "owner",
        email: current_user.email,
        token: generate_token(32)
      )
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

  # NOTE: Research send_data & send_file
  def publications_json
    data = Publication.all
    send_data data
  end

  private

  def publications
    # find the passkeys with current user_id
    @passkeys = current_user.passkeys
    @publications = []
    @passkeys.each do |passkey|
      get_publications = Publication.where(user_id: passkey.user_id).all
      @publications = get_publications if get_publications
      @passkey = passkey
    end
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
      :position,
      :cover,
      :thumb
    )
  end
end
