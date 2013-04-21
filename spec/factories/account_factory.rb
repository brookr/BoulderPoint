FactoryGirl.define do
  factory :account do
    name Faker::Company.name
    full_domain "test_host"
  end

  factory :test_account, class: Account do
    before(:create) { |acct| acct.plan = FactoryGirl.create(:free_plan) }
    name Faker::Company.name
    full_domain "test.boulder.dev"
  end
end
