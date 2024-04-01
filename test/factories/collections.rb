FactoryBot.define do
  factory :collection do
    name { Faker::Book.unique.title }
    published_at { Date.current.days_ago(rand(20)) }
    teaser { Faker::Lorem.paragraph(sentence_count: rand(3..7)) }
    genre

    trait :unpublished do
      published_at { nil }
    end

    trait :archived do
      archived_at { Date.yesterday }
    end
  end
end
