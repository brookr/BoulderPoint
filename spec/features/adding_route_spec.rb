require "spec_helper"

feature "As a User" do
  before(:each) do
    @admin = FactoryGirl.create(:admin)
    @account = @admin.account
    @user = FactoryGirl.create(:test_user, account: @account)
    FactoryGirl.create(:problem, account: @account)
  end

  scenario "I want to add a route so that I can track my climbs" do
    sign_in_now
    visit new_route_path
    select @user.name, from: "route_user_id"
    select @account.problems.last.name, from: "route_problem_id"
    click_on "Create Route"
  end
end
