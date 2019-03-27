# frozen_string_literal: true

FactoryBot.define do
  factory :article, class: Article do
    association :publication, factory: :publication
    title       { Faker::Book.title }
    description { Faker::Lorem.sentence(4) }
  end

  factory :invalid_article, class: Article do
    association :publication, factory: :publication
    title       { "" }
    description { Faker::Lorem.sentence(4) }
  end
end
