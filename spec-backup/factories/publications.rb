# frozen_string_literal: true

FactoryBot.define do
  factory :publication, class: Publication do
    association :user, factory: :user
    title       { Faker::Book.title }
    description { Faker::Lorem.sentence(4) }
  end

  factory :invalid_publication, class: Publication do
    association :user, factory: :user
    title       { "" }
    description { Faker::Lorem.sentence(4) }
  end
end
