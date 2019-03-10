# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    email         { "test@test.com" }
    password      { "pa$$word" }
    confirmed_at  { Time.zone.now }
  end

  factory :random_user, class: User do
    email         { Faker::Internet.safe_email }
    password      { Faker::Internet.password }
    confirmed_at  { Time.zone.now }
  end
end
