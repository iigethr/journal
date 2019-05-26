# frozen_string_literal: true

class TextsController < AgentsController
  # Callbacks
  # ---------

  before_action :text, only: [:edit, :update, :destroy]

  # Methods
  # -------

  def edit
  end

  def update
    if text.update(text_params)
      flash[:notice] = "Text was successfully updated."
      redirect_to parent_url(@parent)
    else
      render :edit
    end
  end

  def destroy
    text.destroy
    flash[:notice] = "Text was successfully destroyed."
    redirect_to parent_url(@parent)
  end

  def new
    @text = Text.new
  end

  def create
    @text = Text.new(text_params)

    if @text.save
      create_agent(@parent, @text)
      flash[:notice] = "Text was successfully created."
      redirect_to parent_url(@parent)
    else
      render :new
    end
  end

  private

  def text
    @text = Text.find_by(slug: params[:id])
  end

  def text_params
    params.require(:text).permit(
      :label,
      :body,
      :position
    )
  end
end
