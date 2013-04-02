require 'spec_helper'

describe "taxinomies/index" do
  before(:each) do
    assign(:taxinomies, [
      stub_model(Taxinomy,
        :dimension => "Dimension",
        :taxon_id => 1,
        :position => 2,
        :weight => 3
      ),
      stub_model(Taxinomy,
        :dimension => "Dimension",
        :taxon_id => 1,
        :position => 2,
        :weight => 3
      )
    ])
  end

  it "renders a list of taxinomies" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Dimension".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
  end
end
