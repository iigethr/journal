# frozen_string_literal: true

class ApplicationController < ActionController::Base
  # Callbacks
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  # Devise configure permitted parameters
  def configure_permitted_parameters
    # Sign up
    devise_parameter_sanitizer.permit(
      :sign_up,
      keys: [
        :slug,
        :active,
        :email,
        :password,
        :password_confirmation,
        profile_attributes: :name
      ]
    )
  end
end
