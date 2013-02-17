require 'spec_helper'

describe "butterflies/edit" do
  before(:each) do
    @butterfly = assign(:butterfly, stub_model(Butterfly,
      :title => "MyString",
      :description => "MyText",
      :author_id => 1,
      :customer_segments => "MyString",
      :value_proposal => "MyString",
      :channels => "MyString",
      :customer_relationship => "MyString",
      :key_resources => "MyString",
      :key_activities => "MyString",
      :key_partnerships => "MyString",
      :revenue_streams => "MyString",
      :cost_structure => "MyString"
    ))
  end

  it "renders the edit butterfly form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => butterflies_path(@butterfly), :method => "post" do
      assert_select "input#butterfly_title", :name => "butterfly[title]"
      assert_select "textarea#butterfly_description", :name => "butterfly[description]"
      assert_select "input#butterfly_author_id", :name => "butterfly[author_id]"
      assert_select "input#butterfly_customer_segments", :name => "butterfly[customer_segments]"
      assert_select "input#butterfly_value_proposal", :name => "butterfly[value_proposal]"
      assert_select "input#butterfly_channels", :name => "butterfly[channels]"
      assert_select "input#butterfly_customer_relationship", :name => "butterfly[customer_relationship]"
      assert_select "input#butterfly_key_resources", :name => "butterfly[key_resources]"
      assert_select "input#butterfly_key_activities", :name => "butterfly[key_activities]"
      assert_select "input#butterfly_key_partnerships", :name => "butterfly[key_partnerships]"
      assert_select "input#butterfly_revenue_streams", :name => "butterfly[revenue_streams]"
      assert_select "input#butterfly_cost_structure", :name => "butterfly[cost_structure]"
    end
  end
end
