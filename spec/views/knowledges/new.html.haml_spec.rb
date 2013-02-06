require 'spec_helper'

describe "knowledges/new" do
  before(:each) do
    assign(:knowledge, stub_model(Knowledge,
      :title => "MyString",
      :description => "MyText",
      :author => ""
    ).as_new_record)
  end

  it "renders new knowledge form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => knowledges_path, :method => "post" do
      assert_select "input#knowledge_title", :name => "knowledge[title]"
      assert_select "textarea#knowledge_description", :name => "knowledge[description]"
      assert_select "input#knowledge_author", :name => "knowledge[author]"
    end
  end
end
