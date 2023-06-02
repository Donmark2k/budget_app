# spec/factories/users.rb

FactoryBot.define do
  factory :user do
    name { 'User1' }
    email { 'user1@email.com' }
    password { '123456' }
    confirmation_token { nil }
    confirmed_at { Time.now }
  end
end
