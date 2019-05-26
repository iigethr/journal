# frozen_string_literal: true

module PiecesHelper
  def edi_piece(parent = "", object = "")
    if controller.controller_name == "articles"
      edit_publication_article_piece_path(@publication, parent, object)
    elsif controller.controller_name == "sections"
      edit_publication_section_piece_path(parent, object)
    end
  end
end
