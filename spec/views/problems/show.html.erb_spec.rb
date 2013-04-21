require 'spec_helper'

describe "problems/show" do
  before(:each) do
    @problem = assign(:problem, stub_model(Problem,
      :account => nil,
      :name => "Name",
      :points => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
    rendered.should match(/Name/)
    rendered.should match(/1/)
  end
end
