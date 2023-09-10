FactoryBot.define do
  factory :entity do
    name { 'MyString' }
    author { nil }
    amount { '9.99' }
    created_at { '2023-09-10 06:24:10' }
  end
end
