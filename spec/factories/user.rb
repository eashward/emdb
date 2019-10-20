# frozen_string_literal: true

FactoryBot.define do
  factory :user, class: User do
     email { "user1@gmail.com"}
     password { "Secret"}
  end
end
