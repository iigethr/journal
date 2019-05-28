# frozen_string_literal: true

module PiecesHelper
  def custom_piece_path(parent, object)
    if controller.controller_name == "articles"
      article_piece_path(parent, object)
    elsif controller.controller_name == "sections"
      section_piece_path(parent, object)
    end
  end

  def custom_edit_piece_path(parent, object)
    if controller.controller_name == "articles"
      edit_article_piece_path(parent, object)
    elsif controller.controller_name == "sections"
      edit_section_piece_path(parent, object)
    end
  end
end
