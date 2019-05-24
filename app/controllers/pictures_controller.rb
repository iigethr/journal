# frozen_string_literal: true

class PicturesController < AgentsController
  # Callbacks
  before_action :picture, only: [:edit, :update, :destroy]

  def edit
  end

  def update
    if picture.update(picture_params)
      flash[:notice] = "Picture was successfully updated."
      redirect_to render_parent_url(@parent)
    else
      render :edit
    end
  end

  def destroy
    picture.destroy
    flash[:notice] = "Picture was successfully destroyed."
    redirect_to render_parent_url(@parent)
  end

  def new
    @picture = Picture.new
  end

  def create
    @picture = Picture.new(picture_params)

    if @picture.save
      create_agent(@parent, @picture)
      flash[:notice] = "Picture was successfully created."
      redirect_to render_parent_url(@parent)
    else
      render :new
    end
  end

  private

  def picture
    @picture = Picture.find_by(slug: params[:id])
  end

  def picture_params
    params.require(:picture).permit(
      :label,
      :caption,
      :upload
    )
  end
end
