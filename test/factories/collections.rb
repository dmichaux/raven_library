FactoryBot.define do
  factory :collection do
    name { Faker::Book.unique.title }
    genre

    trait :published do
      published_at { Date.current.days_ago(rand(20)) }
    end

    trait :archived do
      archived_at { Date.yesterday }
    end
  end
end
