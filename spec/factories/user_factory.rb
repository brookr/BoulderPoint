FactoryGirl.define do
  factory :user do
    name Faker::Name.name
    email Faker::Internet.email
    account
    password 'foobar'
    password_confirmation 'foobar'
  end

  factory :test_user, class: User do
    name Faker::Name.name
    email Faker::Internet.email
    admin false
    association :account, factory: :test_account
    password 'foobar'
    password_confirmation 'foobar'
  end

  factory :admin, class: User do
    name Faker::Name.name
    email Faker::Internet.email
    admin true
    password 'foobar'
    password_confirmation 'foobar'
    after(:create) {|object| FactoryGirl.create(:test_account, admin: object) }
  end
end
