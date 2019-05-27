# frozen_string_literal: true

require "rails_helper"

RSpec.describe HomeController, type: :controller do
  login_user

  # Index
  describe "GET index" do
    it " - should display page - " do
      get :index
      expect(response).to be_successful
    end
  end
end
