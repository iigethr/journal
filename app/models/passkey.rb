# frozen_string_literal: true

class Passkey < ApplicationRecord
  # User
  belongs_to :user, optional: true
  # Organization
  belongs_to :publication

  # Validations
  validates :user_id, uniqueness: { scope: :publication_id }, allow_blank: true

  # Unlock
  def self.unlock(user, publication)
    find_by(user_id: user.id, publication_id: publication.id)
  end

  # Search
  def self.search(token = "")
    where(
      token: token,
      active: false
    ).where.not(
      active: true
    ).first
  end

  # Annonymous
  def passkey_identify
    if user.presence
      user.username.to_s
    else
      "annonymous"
    end
  end
end
