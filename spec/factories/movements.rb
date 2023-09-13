FactoryBot.define do
  factory :movement do
    sequence(:name) { |n| "Sample Transaction #{n}" }
    description { 'Sample description' }
    amount { 22_222.0 }
    category
    user
  end
end
