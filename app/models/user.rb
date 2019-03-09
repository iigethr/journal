# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable and :timeoutable
  devise  :database_authenticatable,
          # :omniauthable,
          :registerable,
          :recoverable,
          :rememberable,
          :trackable,
          :validatable
end
