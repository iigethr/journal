# frozen_string_literal: true

module ParentsHelper
  # Parent url
  def parent_url(parent)
    if params[:article_id]
      publication_article_path(parent.publication, parent)
    elsif params[:section_id]
      publication_section_path(parent.publication, parent)
    end
  end
end
