require 'spec_helper'

describe "butterflies/index" do
  before(:each) do
    assign(:butterflies, [
      stub_model(Butterfly,
        :title => "Title",
        :description => "MyText",
        :author_id => 1,
        :customer_segments => "Customer Segments",
        :value_proposal => "Value Proposal",
        :channels => "Channels",
        :customer_relationship => "Customer Relationship",
        :key_resources => "Key Resources",
        :key_activities => "Key Activities",
        :key_partnerships => "Key Partnerships",
        :revenue_streams => "Revenue Streams",
        :cost_structure => "Cost Structure"
      ),
      stub_model(Butterfly,
        :title => "Title",
        :description => "MyText",
        :author_id => 1,
        :customer_segments => "Customer Segments",
        :value_proposal => "Value Proposal",
        :channels => "Channels",
        :customer_relationship => "Customer Relationship",
        :key_resources => "Key Resources",
        :key_activities => "Key Activities",
        :key_partnerships => "Key Partnerships",
        :revenue_streams => "Revenue Streams",
        :cost_structure => "Cost Structure"
      )
    ])
  end

  it "renders a list of butterflies" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Customer Segments".to_s, :count => 2
    assert_select "tr>td", :text => "Value Proposal".to_s, :count => 2
    assert_select "tr>td", :text => "Channels".to_s, :count => 2
    assert_select "tr>td", :text => "Customer Relationship".to_s, :count => 2
    assert_select "tr>td", :text => "Key Resources".to_s, :count => 2
    assert_select "tr>td", :text => "Key Activities".to_s, :count => 2
    assert_select "tr>td", :text => "Key Partnerships".to_s, :count => 2
    assert_select "tr>td", :text => "Revenue Streams".to_s, :count => 2
    assert_select "tr>td", :text => "Cost Structure".to_s, :count => 2
  end
end
