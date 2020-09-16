FactoryBot.define do
  factory :topic do
    association :user
    title { "HOUSE MUSIC" }
    category_id { 2 }
  end
end
