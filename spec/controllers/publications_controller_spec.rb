# frozen_string_literal: true

require "rails_helper"

RSpec.describe PublicationsController do
  let(:user) { instance_double(User) }
  before { log_in(user) }

  describe "GET #index" do
    it "returns status ok" do
      get :index
      expect(response.status).to be(200)
    end
  end

  describe "GET #new" do
    it "returns status ok" do
      get :new
      expect(response.status).to be(200)
    end
  end
end
