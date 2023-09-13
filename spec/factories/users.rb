FactoryBot.define do
  factory :user do
    name { 'Mr. User' }
    sequence(:email) { |n| "user#{n}@example.com" }
    password { 'password' }
    role { 'user' }

    after(:create) do |user|
      create(:category, author: user)
    end
  end

  factory :admin, class: 'User' do
    name { 'Super Romans' }
    sequence(:email) { |n| "admin#{n}@example.com" }
    password { 'adminpassword' }
    role { 'admin' }
  end
end
