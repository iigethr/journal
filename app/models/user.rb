# frozen_string_literal: true

class User < ApplicationRecord
  # Relationships
  # Profile
  has_one :profile, dependent: :destroy, autosave: true
  accepts_nested_attributes_for :profile
  ## Passkeys
  has_many :passkeys, dependent: :nullify
  accepts_nested_attributes_for :passkeys, allow_destroy: false

  # Include default devise modules. Others available are:
  # :lockable and :timeoutable
  devise  :database_authenticatable,
          # :confirmable,
          # :omniauthable,
          :registerable,
          :recoverable,
          :rememberable,
          :trackable,
          :validatable

  # Class Methods
end
