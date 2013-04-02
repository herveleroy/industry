require 'spec_helper'

describe "taxinomies/new" do
  before(:each) do
    assign(:taxinomy, stub_model(Taxinomy,
      :dimension => "MyString",
      :taxon_id => 1,
      :position => 1,
      :weight => 1
    ).as_new_record)
  end

  it "renders new taxinomy form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => taxinomies_path, :method => "post" do
      assert_select "input#taxinomy_dimension", :name => "taxinomy[dimension]"
      assert_select "input#taxinomy_taxon_id", :name => "taxinomy[taxon_id]"
      assert_select "input#taxinomy_position", :name => "taxinomy[position]"
      assert_select "input#taxinomy_weight", :name => "taxinomy[weight]"
    end
  end
end
