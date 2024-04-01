FactoryBot.define do
  factory :genre do
    name { Faker::Book.unique.genre }
    published_at { Date.current.days_ago(rand(20)) }
  end

  trait :unpublished do
    published_at { nil }
  end

  trait :archived do
    archived_at { Date.yesterday }
  end
end
