# frozen_string_literal: true

FactoryBot.define do
  factory :rating, class: Rating do
    user_rating { rand(1..10) }
    movie
    user
   end
end
