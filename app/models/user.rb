# frozen_string_literal: true

class User < ApplicationRecord
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
end
