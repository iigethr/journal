# frozen_string_literal: true

module ParentsHelper
  # Parent url
  def parent_url(parent)
    if params[:article_id]
      journal_article_path(parent.journal, parent)
    elsif params[:section_id]
      journal_section_path(parent.journal, parent)
    end
  end
end
