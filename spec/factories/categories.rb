FactoryBot.define do
  factory :category do
    name { 'Sample Category' }
    association :author, factory: :user
  end
end
