FactoryBot.define do
  factory :user do
    name { 'user1' }
    email { 'user1@example.com' }
    password { 'password' }
    password_confirmation { 'password' }
    admin { false }
  end
  factory :admin_user, class: User do
    name { 'admin_user' }
    email { 'admin@example.com' }
    password { 'password' }
    password_confirmation { 'password' }
    admin { true }
  end
end
