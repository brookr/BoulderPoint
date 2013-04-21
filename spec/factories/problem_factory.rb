FactoryGirl.define do
  factory :problem do
    association :account, factory: :test_account
    name "V0"
    points 10
  end
end
