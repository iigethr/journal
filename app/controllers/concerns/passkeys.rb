# frozen_string_literal: true

module Passkeys
  extend ActiveSupport::Concern
  included do
    def passkey
      @passkey = Passkey.unlock(current_user, publication)
      redirect_to root_path unless @passkey
    end
  end
end
