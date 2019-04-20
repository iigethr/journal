# frozen_string_literal: true

module CleanVideo
  extend ActiveSupport::Concern
  included do
    # Callbacks
    # ---------
    # Clean video
    before_validation :clean_video_id, if: :check_if_video?
    # before_validation :clean_video_id, on: :create, if: :check_if_video?

    # Save only the ID
    # Applied to the following services: youtube & vimeo
    def clean_video_id
      self.video_box = clean_video_regex
    end

    # Regular Expression
    def clean_video_regex
      video_box.to_s.gsub(%r{.*[\/]|.*[.*\=]}, "")
    end

    # Check if video
    def check_if_video?
      video == true if has_attribute? :video
    end
  end
end
