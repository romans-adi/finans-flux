FactoryBot.define do
  factory :category do
    name { 'Sample Category' }
    author { create(:user) }
  end
end
