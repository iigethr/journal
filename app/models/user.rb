# frozen_string_literal: true

class User < ApplicationRecord
  # Relationships
  has_many :publications, dependent: :destroy
  accepts_nested_attributes_for :publications

  # Include default devise modules. Others available are:
  # :lockable and :timeoutable
  devise  :database_authenticatable,
          :confirmable,
          # :omniauthable,
          :registerable,
          :recoverable,
          :rememberable,
          :trackable,
          :validatable

  # Class Methods
end
