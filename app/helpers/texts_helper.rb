# frozen_string_literal: true

module TextsHelper
  def edi_text(parent = "", object = "")
    if controller.controller_name == "articles"
      edit_publication_article_text_path(@publication, parent, object)
    elsif controller.controller_name == "sections"
      edit_publication_section_text_path(parent, object)
    end
  end
end
