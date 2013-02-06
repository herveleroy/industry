require 'spec_helper'

describe "caterpillars/index" do
  before(:each) do
    assign(:caterpillars, [
      stub_model(Caterpillar,
        :title => "Title",
        :author => "",
        :description => "MyText",
        :, => ",",
        :application => "MyText"
      ),
      stub_model(Caterpillar,
        :title => "Title",
        :author => "",
        :description => "MyText",
        :, => ",",
        :application => "MyText"
      )
    ])
  end

  it "renders a list of caterpillars" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => ",".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
