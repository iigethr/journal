# frozen_string_literal: true

class ProfilesController < ApplicationController
  # Callbacks
  before_action :set_profile, only: [:show, :edit, :update]

  def show
  end

  def edit
  end

  def update
    if @profile.update(profile_params)
      flash[:notice] = "Profile was successfully updated."
      redirect_to profile_path
    else
      render :edit
    end
  end

  private

  def set_profile
    @profile = current_user.profile
  end

  def profile_params
    params.require(:profile).permit(
      :user_id,
      :first_name,
      :middle_name,
      :last_name
    )
  end
end
