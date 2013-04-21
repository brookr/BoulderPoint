require 'spec_helper'

describe "routes/show" do
  before(:each) do
    @route = assign(:route, stub_model(Route,
      :user => nil,
      :problem => nil,
      :notes => "Notes"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
    rendered.should match(//)
    rendered.should match(/Notes/)
  end
end
