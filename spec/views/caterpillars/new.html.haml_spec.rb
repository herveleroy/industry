require 'spec_helper'

describe "caterpillars/new" do
  before(:each) do
    assign(:caterpillar, stub_model(Caterpillar,
      :title => "MyString",
      :author => "",
      :description => "MyText",
      :, => "MyString",
      :application => "MyText"
    ).as_new_record)
  end

  it "renders new caterpillar form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => caterpillars_path, :method => "post" do
      assert_select "input#caterpillar_title", :name => "caterpillar[title]"
      assert_select "input#caterpillar_author", :name => "caterpillar[author]"
      assert_select "textarea#caterpillar_description", :name => "caterpillar[description]"
      assert_select "input#caterpillar_,", :name => "caterpillar[,]"
      assert_select "textarea#caterpillar_application", :name => "caterpillar[application]"
    end
  end
end
