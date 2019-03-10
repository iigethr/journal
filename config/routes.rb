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

  # Publications
  resources :publications

  # Root
  root "home#index"
  resources :home
end
