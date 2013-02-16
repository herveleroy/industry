require 'spec_helper'

describe "chrysalis/index" do
  before(:each) do
    assign(:chrysalis, [
      stub_model(Chrysali,
        :title => "Title",
        :description => "MyText",
        :author_id => 1,
        :state => "State",
        :value_proposal => "Value Proposal",
        :application => "Application",
        :conditions => "Conditions",
        :obstacles => "Obstacles"
      ),
      stub_model(Chrysali,
        :title => "Title",
        :description => "MyText",
        :author_id => 1,
        :state => "State",
        :value_proposal => "Value Proposal",
        :application => "Application",
        :conditions => "Conditions",
        :obstacles => "Obstacles"
      )
    ])
  end

  it "renders a list of chrysalis" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "State".to_s, :count => 2
    assert_select "tr>td", :text => "Value Proposal".to_s, :count => 2
    assert_select "tr>td", :text => "Application".to_s, :count => 2
    assert_select "tr>td", :text => "Conditions".to_s, :count => 2
    assert_select "tr>td", :text => "Obstacles".to_s, :count => 2
  end
end
