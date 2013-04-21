module UserSpecHelpers
  def sign_in_now
    visit "/users/sign_in"
    page.should have_content "Sign in"
    fill_in "Email", with: @user.email
    fill_in "Password", with: "foobar"
    click_on "Sign in"
    page.should have_content "Dashboard"
  end
  def sign_in_admin
    visit "/users/sign_in"
    page.should have_content "Sign in"
    fill_in "Email", with: @admin.email
    fill_in "Password", with: "foobar"
    click_on "Sign in"
    page.should have_content "Dashboard"
  end
end
