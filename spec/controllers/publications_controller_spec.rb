# frozen_string_literal: true

require "rails_helper"

RSpec.describe PublicationsController, type: :controller do
  login_user

  # Index
  describe "GET index" do
    it " - should display all records - " do
      get :index
      expect(response).to be_successful
    end
  end

  # Show
  describe "GET show" do
    it " - should display a single record - " do
      user = subject.current_user
      publication = create(:publication, user: user)

      get :show, params: { id: publication.to_param }
      expect(response).to be_successful
    end
  end

  # Edit
  describe "GET edit" do
    it " - should display a single editable record - " do
      user = subject.current_user
      publication = create(:publication, user: user)

      get :edit, params: { id: publication.to_param }
      expect(response).to be_successful
    end
  end

  # Update
  describe "PUT update" do
    context " -- with valid params -- " do
      it " - should update the requested record - " do
        user = subject.current_user
        params = attributes_for(:publication)
        publication = create(:publication, user: user)

        put :update, params: { id: publication.to_param, publication: params }
        publication.reload
      end
      it " - should update & redirect to requested record - " do
        user = subject.current_user
        params = attributes_for(:publication)
        publication = create(:publication, user: user)

        put :update, params: { id: publication.to_param, publication: params }
        expect(response).to redirect_to(publication)
      end
    end
    context " -- with invalid params -- " do
      it " - should not update the requested record - " do
        user = subject.current_user
        params = attributes_for(:invalid_publication)
        publication = create(:publication, user: user)

        put :update, params: { id: publication.to_param, publication: params }
        expect(response).to be_successful
      end
    end
  end

  # Destroy
  describe "DELETE destroy" do
    it " - should destroy the requested record - " do
      user = subject.current_user
      publication = create(:publication, user: user)

      expect {
        delete :destroy, params: { id: publication.to_param }
      }.to change(Publication, :count).by(-1)
    end
    it " - should redirect to the records list - " do
      user = subject.current_user
      publication = create(:publication, user: user)

      delete :destroy, params: {id: publication.to_param}
      expect(response).to redirect_to(publications_url)
    end
  end

  # New
  describe "GET new" do
    it " - should return a success response - " do
      get :new
      expect(response).to be_successful
    end
  end

  # Create
  describe "POST create" do
    context "-- with valid params --" do
      it " - should create a new record - " do
        user = subject.current_user
        params = attributes_for(:publication, user_id: user)

        expect {
          post :create, params: { publication: params }
        }.to change(Publication, :count).by(1)
      end
    end

    context "-- with invalid params --" do
      it " - should not create a new record - " do
        user = subject.current_user
        params = attributes_for(:invalid_publication, user_id: user)

        expect {
          post :create, params: { publication: params }
        }.to change(Publication, :count).by(0)
      end
    end
  end
end
