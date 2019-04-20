# frozen_string_literal: true

Rails.application.routes.draw do
  # Devise
  devise_for :users, path: "", controllers: {
    confirmations: "users/confirmations",
    # omniauth_callbacks: "users/omniauth_callbacks",
    passwords: "users/passwords",
    registrations: "users/registrations",
    sessions: "users/sessions",
    unlocks: "users/unlocks"
  }
  # Profiles
  resource :profile, only: [:show, :edit, :update]

  # Publications
  resources :publications do
    resources :articles do
      resources :galleries
      resources :pictures
      resources :videos
      resources :texts
      resources :documents
      collection do
        patch :sortable
      end
    end
    collection do
      patch :sortable
    end
  end

  resources :articles do
    resources :galleries
    resources :pictures
    resources :videos
    resources :texts
    resources :documents
  end

  resources :galleries
  resources :pictures
  resources :videos
  resources :texts
  resources :documents

  # Root
  root "home#index"
  resources :home
end
