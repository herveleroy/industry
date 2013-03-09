require 'spec_helper'

describe "challenges/index" do
  before(:each) do
    assign(:challenges, [
      stub_model(Challenge,
        :name => "Name",
        :description => "MyText",
        :owner => "",
        :state => "State"
      ),
      stub_model(Challenge,
        :name => "Name",
        :description => "MyText",
        :owner => "",
        :state => "State"
      )
    ])
  end

  it "renders a list of challenges" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "State".to_s, :count => 2
  end
end
