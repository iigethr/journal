# frozen_string_literal: true

module ControllerSupport
  def login_user
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      user = FactoryBot.create(:user)
      user.confirmed_at
      sign_in user
    end
  end
end
