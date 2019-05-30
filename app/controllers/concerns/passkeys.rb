# frozen_string_literal: true

module Passkeys
  extend ActiveSupport::Concern
  included do
    def passkey
      @passkey = Passkey.unlock(current_user, @publication)
      return if @passkey

      flash[:alert] = "Oops. Something went wrong!"
      redirect_to publications_path
    end
  end
end
