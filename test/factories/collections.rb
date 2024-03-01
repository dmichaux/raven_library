FactoryBot.define do
  factory :collection do
    name { Faker::Book.unique.genre }
  end
end
