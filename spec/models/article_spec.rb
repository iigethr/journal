# frozen_string_literal: true

require "rails_helper"

RSpec.describe Article, type: :model do
  describe "valid Factory" do
    it " - should have a valid factory - " do
      publication = build :publication
      expect(build :article).to be_valid
    end

    it " - should not have a valid factory - " do
      publication = build :publication
      expect(build :invalid_article).to_not be_valid
    end
  end
end
