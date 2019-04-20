# frozen_string_literal: true

module CleanCaption
  extend ActiveSupport::Concern
  included do
    # Clean caption
    def clean_caption(object, type)
      update_column(type, "") unless object.presence
    end
  end
end
