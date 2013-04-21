require "spec_helper"

feature "As an Admin" do
  before(:each) do
    @admin = FactoryGirl.create(:admin)
    @account = @admin.account
    @user = FactoryGirl.create(:test_user, account: @account)
  end

  scenario "I want to define a new problem for this account so that I can track points" do
    sign_in_admin
    visit new_problem_path
    fill_in "Name", with: "V1"
    fill_in "Points", with: "20"
    click_on "Create Problem"
    page.should have_content "Problem was successfully created"
  end
end
