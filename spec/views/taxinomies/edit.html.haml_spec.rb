require 'spec_helper'

describe "taxinomies/edit" do
  before(:each) do
    @taxinomy = assign(:taxinomy, stub_model(Taxinomy,
      :dimension => "MyString",
      :taxon_id => 1,
      :position => 1,
      :weight => 1
    ))
  end

  it "renders the edit taxinomy form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => taxinomies_path(@taxinomy), :method => "post" do
      assert_select "input#taxinomy_dimension", :name => "taxinomy[dimension]"
      assert_select "input#taxinomy_taxon_id", :name => "taxinomy[taxon_id]"
      assert_select "input#taxinomy_position", :name => "taxinomy[position]"
      assert_select "input#taxinomy_weight", :name => "taxinomy[weight]"
    end
  end
end
