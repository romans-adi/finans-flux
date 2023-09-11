FactoryBot.define do
  factory :transaction do
    category { nil }
    description { 'MyString' }
    amount { '9.99' }
  end
end
