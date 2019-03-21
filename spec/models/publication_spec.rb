# frozen_string_literal: true

require "rails_helper"

RSpec.describe Publication, type: :model do
  context "valid Factory" do
    it "has a valid factory" do
      user = build :user
      expect((build :publication)).to be_valid
    end
  end
end
