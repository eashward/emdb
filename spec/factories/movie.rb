# frozen_string_literal: true

FactoryBot.define do
  factory :movie, class: Movie do
    title { Faker::Name.name }
    category
    rating { 2 }
    description { 'Desc' }
  end
end
