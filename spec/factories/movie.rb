FactoryBot.define do
  factory :movie, class: Movie do
    title { Faker::Name.name }
    category
    rating { 2 }
    description { "Desc" }
  end

  factory :category, class: Category do
    category { Faker::Name.name }
  end
end