FactoryBot.define do
  factory :movement do
    name { 'Sample Transaction' }
    description { 'Sample Description' }
    amount { 100.00 }
    user
    category
  end
end
