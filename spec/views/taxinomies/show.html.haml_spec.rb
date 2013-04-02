require 'spec_helper'

describe "taxinomies/show" do
  before(:each) do
    @taxinomy = assign(:taxinomy, stub_model(Taxinomy,
      :dimension => "Dimension",
      :taxon_id => 1,
      :position => 2,
      :weight => 3
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Dimension/)
    rendered.should match(/1/)
    rendered.should match(/2/)
    rendered.should match(/3/)
  end
end
