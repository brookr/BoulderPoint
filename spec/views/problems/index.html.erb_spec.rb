require 'spec_helper'

describe "problems/index" do
  before(:each) do
    assign(:problems, [
      stub_model(Problem,
        :account => nil,
        :name => "Name",
        :points => 1
      ),
      stub_model(Problem,
        :account => nil,
        :name => "Name",
        :points => 1
      )
    ])
  end

  it "renders a list of problems" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
