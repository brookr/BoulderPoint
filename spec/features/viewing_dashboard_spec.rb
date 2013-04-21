require "spec_helper"

feature "As a User" do

  before(:each) do
    @admin = FactoryGirl.create(:admin)
    @account = @admin.account
    @user = FactoryGirl.create(:test_user, account: @account)
  end

  scenario "I want a list of account members so that I can see recent activity" do
    sign_in_now
    page.should have_content @user.name
    page.should have_content "Latest scores"
  end

  scenario "I want recent scores for account members so I can get a summary" do
    sign_in_now
    within("table") do
      page.should have_content "Latest Score"
    end
  end
end
