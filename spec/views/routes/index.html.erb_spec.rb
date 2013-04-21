require 'spec_helper'

describe "routes/index" do
  before(:each) do
    assign(:routes, [
      stub_model(Route,
        :user => nil,
        :problem => nil,
        :notes => "Notes"
      ),
      stub_model(Route,
        :user => nil,
        :problem => nil,
        :notes => "Notes"
      )
    ])
  end

  it "renders a list of routes" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Notes".to_s, :count => 2
  end
end
