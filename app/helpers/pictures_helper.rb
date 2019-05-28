# frozen_string_literal: true

module PicturesHelper
  def custom_picture_path(parent, object)
    if controller.controller_name == "articles"
      article_picture_path(parent, object)
    elsif controller.controller_name == "sections"
      section_picture_path(parent, object)
    end
  end

  def custom_edit_picture_path(parent, object)
    if controller.controller_name == "articles"
      edit_article_picture_path(parent, object)
    elsif controller.controller_name == "sections"
      edit_section_picture_path(parent, object)
    end
  end
end
