require 'spec_helper'

describe "challenges/new" do
  before(:each) do
    assign(:challenge, stub_model(Challenge,
      :name => "MyString",
      :description => "MyText",
      :owner => "",
      :state => "MyString"
    ).as_new_record)
  end

  it "renders new challenge form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => challenges_path, :method => "post" do
      assert_select "input#challenge_name", :name => "challenge[name]"
      assert_select "textarea#challenge_description", :name => "challenge[description]"
      assert_select "input#challenge_owner", :name => "challenge[owner]"
      assert_select "input#challenge_state", :name => "challenge[state]"
    end
  end
end
