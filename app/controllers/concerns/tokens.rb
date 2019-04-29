# frozen_string_literal: true

module Tokens
  extend ActiveSupport::Concern
  included do
    def generate_token(lenth = "")
      SecureRandom.hex(lenth)
    end
  end
end
