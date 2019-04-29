# frozen_string_literal: true

class TextsController < ApplicationController
  # Concerns
  include Acts
  include Passkeys

  # Callbacks
  before_action :article
  before_action :text, only: [:show, :edit, :update, :destroy]
  before_action :publication
  before_action :passkey

  def index
    redirect_to article_path(@article)
  end

  def show
    redirect_to article_path(@article)
  end

  def edit
  end

  def update
    if text.update(text_params)
      flash[:notice] = "Text was successfully updated."
      redirect_to article_path(@article)
    else
      render :edit
    end
  end

  def destroy
    text.destroy
    flash[:notice] = "Text was successfully destroyed."
    redirect_to article_path(@article)
  end

  def new
    @text = Text.new
  end

  def create
    @text = Text.new(text_params)

    if @text.save
      create_agent(@article, @text)
      flash[:notice] = "Text was successfully created."
      redirect_to article_path(@article)
    else
      render :new
    end
  end

  private

  def article
    @article = Article.find_by(slug: params[:article_id])
    # Childs parent
    publication = Publication.where(id: @article.publication_id).first
    redirect_to root_path if publication.user_id != current_user.id
  end

  def text
    @text = @article.texts.find_by(slug: params[:id])
  end

  def publication
    @publication = @article.publication
  end

  def text_params
    params.require(:text).permit(
      :article_id,
      :body,
      :position
    )
  end
end
