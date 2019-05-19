# frozen_string_literal: true

module Passkeys
  extend ActiveSupport::Concern
  included do
    def order_publication(publication)
      order = Publication.pluck(:position).compact
      order << 0
      publication.position = (order.min - 1)
    end

    def passkey
      @passkey = Passkey.unlock(current_user, @publication)
      unless @passkey
        flash[:alert] = "Oops. Something went wrong!"
        redirect_to publications_path
      end
    end

    def create_passkey(user, publication)
      passkey = Passkey.create(
        active: true,
        user_id: user.id,
        publication_id: publication.id,
        role: "owner",
        email: user.email,
        token: generate_token(32)
      )
    end
  end
end
