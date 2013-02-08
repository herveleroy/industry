require 'spec_helper'

describe "documents/edit" do
  before(:each) do
    @document = assign(:document, stub_model(Document,
      :name => "MyString",
      :attachable_id => 1
    ))
  end

  it "renders the edit document form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => documents_path(@document), :method => "post" do
      assert_select "input#document_name", :name => "document[name]"
      assert_select "input#document_attachable_id", :name => "document[attachable_id]"
    end
  end
end
