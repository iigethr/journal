# frozen_string_literal: true

class Passkey < ApplicationRecord
  # User
  belongs_to :user, optional: true
  # Organization
  belongs_to :journal

  # Validations
  validates :user_id, uniqueness: { scope: :journal_id }, allow_blank: true

  # Callbacks
  has_secure_token :token

  # Unlock
  def self.unlock(user, journal)
    find_by(user_id: user.id, journal_id: journal.id)
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
