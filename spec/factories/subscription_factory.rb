FactoryGirl.define do
  factory :subscription do
    association :subscription_plan, factory: :free_plan
    user_limit 5
    next_renewal_at { 1.day.ago.to_s(:db) }
    amount 10
    card_number "XXXX-XXXX-XXXX1111"
    card_expiration "052012"
  end
end
