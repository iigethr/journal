# frozen_string_literal: true

require "rails_helper"

RSpec.describe ArticlesController, type: :controller do
  login_user

  # Index
  describe "GET index" do
    it " - should display all records - " do
      user = subject.current_user
      publication = create(:publication, user: user)

      get :index, params: { publication_id: publication.id }
      expect(response).to be_successful
    end
  end

  # Show
  describe "GET show" do
    it " - should display a single record - " do
      user = subject.current_user
      publication = create(:publication, user: user)
      article = create(:article, publication: publication)

      get :show, params: { publication_id: publication.id, id: article.to_param }
      expect(response).to be_successful
    end
  end

  # Edit
  describe "GET edit" do
    it " - should display a single editable record - " do
      user = subject.current_user
      publication = create(:publication, user: user)
      article = create(:article, publication: publication)

      get :edit, params: { publication_id: publication.id, id: article.to_param }
      expect(response).to be_successful
    end
  end

  # Update
  describe "PUT update" do
    context " -- with valid params -- " do
      it " - should update the requested record - " do
        user = subject.current_user
        publication = create(:publication, user: user)
        params = attributes_for(:article)
        article = create(:article, publication: publication)

        put :update, params: { publication_id: publication.id, id: article.to_param, article: params }
        publication.reload
      end
      it " - should update & redirect to requested record - " do
        user = subject.current_user
        publication = create(:publication, user: user)
        params = attributes_for(:article)
        article = create(:article, publication: publication)

        put :update, params: { publication_id: publication.id, id: article.to_param, article: params }
        expect(response).to redirect_to(publication_article_path(publication, article))
      end
    end
    context " -- with invalid params -- " do
      it " - should not update the requested record - " do
        user = subject.current_user
        publication = create(:publication, user: user)
        params = attributes_for(:invalid_article)
        article = create(:article, publication: publication)

        put :update, params: { publication_id: publication.id, id: article.to_param, article: params }
        expect(response).to be_successful
      end
    end
  end

  # Destroy
  describe "DELETE destroy" do
    it " - should destroy the requested record - " do
      user = subject.current_user
      publication = create(:publication, user: user)
      params = attributes_for(:invalid_article)
      article = create(:article, publication: publication)

      expect {
        delete :destroy, params: { publication_id: publication.id, id: article.to_param }
      }.to change(Article, :count).by(-1)
    end
    it " - should redirect to the records list - " do
      user = subject.current_user
      publication = create(:publication, user: user)
      params = attributes_for(:invalid_article)
      article = create(:article, publication: publication)

      delete :destroy, params: { publication_id: publication.id, id: article.to_param }
      expect(response).to redirect_to(publication_articles_path(publication,))
    end
  end

  # New
  describe "GET new" do
    it " - should return a success response - " do
      user = subject.current_user
      publication = create(:publication, user: user)

      get :new, params: { publication_id: publication.id }
      expect(response).to be_successful
    end
  end

  # Create
  describe "POST create" do
    context "-- with valid params --" do
      it " - should create a new record - " do
        user = subject.current_user
        publication = create(:publication, user: user)
        params = attributes_for(:article)
        article = create(:article, publication: publication)

        expect {
          post :create, params: { publication_id: publication.id, article: params }
        }.to change(Article, :count).by(1)
      end
    end

    context "-- with invalid params --" do
      it " - should not create a new record - " do
        user = subject.current_user
        publication = create(:publication, user: user)
        params = attributes_for(:invalid_article)
        article = create(:article, publication: publication)

        expect {
          post :create, params: { publication_id: publication.id, article: params }
        }.to change(Article, :count).by(0)
      end
    end
  end
end
