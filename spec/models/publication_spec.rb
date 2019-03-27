# frozen_string_literal: true

require "rails_helper"

RSpec.describe Publication, type: :model do
  describe "valid Factory" do
    it " - should have a valid factory - " do
      user = build :user
      expect(build :publication).to be_valid
    end

    it " - should not have a valid factory - " do
      user = build :user
      expect(build :invalid_publication).to_not be_valid
    end
  end
end
