FactoryBot.define do
  factory :category do
    sequence(:name) { |n| "Sample Category #{n}" }
    icon { 'sample_icon' }
    association :author, factory: :user

    after(:create) do |category|
      puts "Created category: #{category.name}"
    end
  end
end
