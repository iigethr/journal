# frozen_string_literal: true

class DocumentsController < ApplicationController
  # Concerns
  include Act

  # Callbacks
  before_action :set_article
  before_action :set_document, only: [:show, :edit, :update, :destroy]

  def index
    @documents = Document.all
  end

  def show
  end

  def edit
  end

  def update
    if @document.update(document_params)
      flash[:notice] = "Document was successfully updated."
      redirect_to @document
    else
      render :edit
    end
  end

  def destroy
    @document.destroy
    flash[:notice] = "Document was successfully destroyed."
    redirect_to documents_url
  end

  def new
    @document = Document.new
  end

  def create
    @document = Document.new(document_params)

    if @document.save
      create_agent(@article, @document)
      flash[:notice] = "Document was successfully created."
      redirect_to @document
    else
      render :new
    end
  end

  private

  def set_article
    @article = Article.find_by(id: params[:article_id])
  end

  def set_document
    @document = Document.find(params[:id])
  end

  def document_params
    params.require(:document).permit(
      :article_id,
      :caption,
      :position
    )
  end
end
