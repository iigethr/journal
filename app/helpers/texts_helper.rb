# frozen_string_literal: true

module TextsHelper
  def edi_text(parent = "", object = "")
    if controller.controller_name == "articles"
      edit_article_text_path(parent, object)
    elsif controller.controller_name == "sections"
      edit_section_text_path(parent, object)
    end
  end
end
