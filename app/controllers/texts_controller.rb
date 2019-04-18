# frozen_string_literal: true

class TextsController < ApplicationController
  # Concerns
  include Act

  # Callbacks
  before_action :article
  before_action :text, only: [:show, :edit, :update, :destroy]

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
      redirect_to article_path(article)
    else
      render :edit
    end
  end

  def destroy
    text.destroy
    flash[:notice] = "Text was successfully destroyed."
    redirect_to article_texts_path(article)
  end

  def new
    @text = Text.new
  end

  def create
    @text = Text.new(text_params)

    if @text.save
      create_agent(@article, @text)
      flash[:notice] = "Text was successfully created."
      redirect_to article_text_path(@article, @text)
    else
      render :new
    end
  end

  private

  def article
    @article = Article.find_by(slug: params[:article_id])
  end

  def text
    @text = Text.find_by(slug: params[:id])
  end

  def text_params
    params.require(:text).permit(
      :body,
      :position
    )
  end
end
