FactoryBot.define do
  factory :writing do
    collection
    author_first { Faker::Name.first_name }
    author_last { Faker::Name.last_name }
    name { Faker::Book.title }
    content { Array.new(rand(15..50)).map { Faker::Lorem.paragraph(sentence_count: rand(2..15)) }.join("\n\n") }

    trait :published do
      published_at { Date.current.days_ago(rand(20)) }
    end

    trait :archived do
      archived_at { Date.yesterday }
    end
  end
end