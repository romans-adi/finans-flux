FactoryBot.define do
  factory :user do
    name { 'Mr. User' }
    email { 'romans@user.com' }
    password { 'password' }
    role { 'user' }
  end

  factory :admin, class: 'User' do
    name { 'Super Romans' }
    email { 'super@user.com' }
    password { 'adminpassword' }
    role { 'admin' }
  end
end
