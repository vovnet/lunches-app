FactoryBot.define do
  factory :user do
    email
    password '123456'
    password_confirmation '123456'
    username
  end

  sequence :email do |e|
    "user#{e}@test.com"
  end

  sequence :username do |u|
    "testuser#{u}"
  end
end
