require 'spec_helper'

describe "butterflies/show" do
  before(:each) do
    @butterfly = assign(:butterfly, stub_model(Butterfly,
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
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Title/)
    rendered.should match(/MyText/)
    rendered.should match(/1/)
    rendered.should match(/Customer Segments/)
    rendered.should match(/Value Proposal/)
    rendered.should match(/Channels/)
    rendered.should match(/Customer Relationship/)
    rendered.should match(/Key Resources/)
    rendered.should match(/Key Activities/)
    rendered.should match(/Key Partnerships/)
    rendered.should match(/Revenue Streams/)
    rendered.should match(/Cost Structure/)
  end
end
