# frozen_string_literal: true

FactoryBot.define do
  factory :publication, class: Publication do
    association :user, factory: :user
    title       { Faker::Lorem.sentence(4) }
    description { Faker::Lorem.sentence(4) }
  end
end
