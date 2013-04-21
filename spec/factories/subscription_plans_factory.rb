FactoryGirl.define do
  factory :free_plan, class: SubscriptionPlan do
    amount 0
    name "Free"
    user_limit 5
  end
end
