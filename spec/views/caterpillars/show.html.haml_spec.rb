require 'spec_helper'

describe "caterpillars/show" do
  before(:each) do
    @caterpillar = assign(:caterpillar, stub_model(Caterpillar,
      :title => "Title",
      :author => "",
      :description => "MyText",
      :, => ",",
      :application => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Title/)
    rendered.should match(//)
    rendered.should match(/MyText/)
    rendered.should match(/,/)
    rendered.should match(/MyText/)
  end
end
