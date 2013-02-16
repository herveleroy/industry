require 'spec_helper'

describe "chrysalis/show" do
  before(:each) do
    @chrysali = assign(:chrysali, stub_model(Chrysali,
      :title => "Title",
      :description => "MyText",
      :author_id => 1,
      :state => "State",
      :value_proposal => "Value Proposal",
      :application => "Application",
      :conditions => "Conditions",
      :obstacles => "Obstacles"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Title/)
    rendered.should match(/MyText/)
    rendered.should match(/1/)
    rendered.should match(/State/)
    rendered.should match(/Value Proposal/)
    rendered.should match(/Application/)
    rendered.should match(/Conditions/)
    rendered.should match(/Obstacles/)
  end
end
