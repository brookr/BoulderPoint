require 'spec_helper'

describe "routes/new" do
  before(:each) do
    assign(:route, stub_model(Route,
      :user => nil,
      :problem => nil,
      :notes => "MyString"
    ).as_new_record)
  end

  it "renders new route form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", routes_path, "post" do
      assert_select "input#route_user[name=?]", "route[user]"
      assert_select "input#route_problem[name=?]", "route[problem]"
      assert_select "input#route_notes[name=?]", "route[notes]"
    end
  end
end
