require 'spec_helper'

describe "problems/edit" do
  before(:each) do
    @problem = assign(:problem, stub_model(Problem,
      :account => nil,
      :name => "MyString",
      :points => 1
    ))
  end

  it "renders the edit problem form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", problem_path(@problem), "post" do
      assert_select "input#problem_account[name=?]", "problem[account]"
      assert_select "input#problem_name[name=?]", "problem[name]"
      assert_select "input#problem_points[name=?]", "problem[points]"
    end
  end
end
