require 'spec_helper'

describe "taxon_rules/show" do
  before(:each) do
    @taxon_rule = assign(:taxon_rule, stub_model(TaxonRule,
      :tags => "MyText",
      :taxon => "Taxon"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/MyText/)
    rendered.should match(/Taxon/)
  end
end
