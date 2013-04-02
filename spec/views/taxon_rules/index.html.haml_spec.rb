require 'spec_helper'

describe "taxon_rules/index" do
  before(:each) do
    assign(:taxon_rules, [
      stub_model(TaxonRule,
        :tags => "MyText",
        :taxon => "Taxon"
      ),
      stub_model(TaxonRule,
        :tags => "MyText",
        :taxon => "Taxon"
      )
    ])
  end

  it "renders a list of taxon_rules" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Taxon".to_s, :count => 2
  end
end
