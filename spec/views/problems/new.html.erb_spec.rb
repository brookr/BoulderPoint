require 'spec_helper'

describe "problems/new" do
  before(:each) do
    assign(:problem, stub_model(Problem,
      :account => nil,
      :name => "MyString",
      :points => 1
    ).as_new_record)
  end

  it "renders new problem form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", problems_path, "post" do
      assert_select "input#problem_account[name=?]", "problem[account]"
      assert_select "input#problem_name[name=?]", "problem[name]"
      assert_select "input#problem_points[name=?]", "problem[points]"
    end
  end
end
