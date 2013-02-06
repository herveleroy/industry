require 'spec_helper'

describe "caterpillars/edit" do
  before(:each) do
    @caterpillar = assign(:caterpillar, stub_model(Caterpillar,
      :title => "MyString",
      :author => "",
      :description => "MyText",
      :, => "MyString",
      :application => "MyText"
    ))
  end

  it "renders the edit caterpillar form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => caterpillars_path(@caterpillar), :method => "post" do
      assert_select "input#caterpillar_title", :name => "caterpillar[title]"
      assert_select "input#caterpillar_author", :name => "caterpillar[author]"
      assert_select "textarea#caterpillar_description", :name => "caterpillar[description]"
      assert_select "input#caterpillar_,", :name => "caterpillar[,]"
      assert_select "textarea#caterpillar_application", :name => "caterpillar[application]"
    end
  end
end
