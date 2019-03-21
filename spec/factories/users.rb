# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    email                 { "test@test.com" }
    password              { "pa$$word" }
    password_confirmation { "pa$$word" }
    confirmed_at          { Time.zone.now }
  end

  factory :random_user, class: User do
    email                 { Faker::Internet.safe_email }
    password              { "pa$$word" }
    password_confirmation { "pa$$word" }
    confirmed_at          { Time.zone.now }
  end
end
