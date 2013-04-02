require 'spec_helper'

describe "taxon_rules/edit" do
  before(:each) do
    @taxon_rule = assign(:taxon_rule, stub_model(TaxonRule,
      :tags => "MyText",
      :taxon => "MyString"
    ))
  end

  it "renders the edit taxon_rule form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => taxon_rules_path(@taxon_rule), :method => "post" do
      assert_select "textarea#taxon_rule_tags", :name => "taxon_rule[tags]"
      assert_select "input#taxon_rule_taxon", :name => "taxon_rule[taxon]"
    end
  end
end
