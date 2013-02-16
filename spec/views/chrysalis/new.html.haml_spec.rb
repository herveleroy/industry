require 'spec_helper'

describe "chrysalis/new" do
  before(:each) do
    assign(:chrysali, stub_model(Chrysali,
      :title => "MyString",
      :description => "MyText",
      :author_id => 1,
      :state => "MyString",
      :value_proposal => "MyString",
      :application => "MyString",
      :conditions => "MyString",
      :obstacles => "MyString"
    ).as_new_record)
  end

  it "renders new chrysali form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => chrysalis_path, :method => "post" do
      assert_select "input#chrysali_title", :name => "chrysali[title]"
      assert_select "textarea#chrysali_description", :name => "chrysali[description]"
      assert_select "input#chrysali_author_id", :name => "chrysali[author_id]"
      assert_select "input#chrysali_state", :name => "chrysali[state]"
      assert_select "input#chrysali_value_proposal", :name => "chrysali[value_proposal]"
      assert_select "input#chrysali_application", :name => "chrysali[application]"
      assert_select "input#chrysali_conditions", :name => "chrysali[conditions]"
      assert_select "input#chrysali_obstacles", :name => "chrysali[obstacles]"
    end
  end
end
