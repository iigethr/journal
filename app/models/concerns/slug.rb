# frozen_string_literal: true

module Slug
  extend ActiveSupport::Concern
  included do
    before_validation :generate_slug, on: :create, uniqueness: true

    def to_param
      slug.to_s
    end
  end

  def generate_slug(size = 8)
    charset = [("a".."z"), ("A".."Z"), (0..9)].map(&:to_a).flatten
    string = (0...size).map { charset[rand(charset.size)] }.join
    self.slug = string
  end
end
