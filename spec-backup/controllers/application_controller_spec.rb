# frozen_string_literal: true

require "rails_helper"

RSpec.describe ApplicationController, type: :controller do
  login_user

  # Current user
  describe "GET current user" do
    it "should have a current_user" do
      expect(subject.current_user).to_not eq(nil)
    end
  end
end
