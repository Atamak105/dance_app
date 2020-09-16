FactoryBot.define do
  factory :post do
    association :user
    association :topic
    body { "おすすめです" }
  end
end
