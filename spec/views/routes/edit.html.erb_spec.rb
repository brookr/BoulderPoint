require 'spec_helper'

describe "routes/edit" do
  before(:each) do
    @route = assign(:route, stub_model(Route,
      :user => nil,
      :problem => nil,
      :notes => "MyString"
    ))
  end

  it "renders the edit route form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", route_path(@route), "post" do
      assert_select "input#route_user[name=?]", "route[user]"
      assert_select "input#route_problem[name=?]", "route[problem]"
      assert_select "input#route_notes[name=?]", "route[notes]"
    end
  end
end
