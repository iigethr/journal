# frozen_string_literal: true

require "rails_helper"

RSpec.describe PublicationsController, type: :controller do
  login_user

  describe "GET current user" do
    it "should have a current_user" do
      expect(subject.current_user).to_not eq(nil)
    end
  end

  describe "GET publications#index" do
    it " - should display all records - " do
      get :index
      expect(response).to be_successful
    end
  end

  describe "GET publications#show" do
    it " - should display a single publication - " do
      user = subject.current_user
      publication = create(:publication, user: user)

      get :show, params: { id: publication.to_param }
      expect(response).to be_successful
    end
  end

  describe "GET publications#new" do
    it "returns a success response" do
      get :new
      expect(response).to be_successful
    end
  end

  describe "POST publications#create" do
    context "-- with valid params --" do
      it " - should create a new publication - " do
        params = attributes_for(:publication, user_id: subject.current_user)
        expect {
          post :create, params: { publication: params }
        }.to change(Publication, :count).by(1)
      end
    end
    context "-- with invalid params --" do
      it " - should not create a new publication - " do
        params = attributes_for(:publication)
        expect {
          post :create, params: { publication: params }
        }.to change(Publication, :count).by(0)
      end
    end
  end
end
