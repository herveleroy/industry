require 'spec_helper'

describe "Taxinomies" do
  describe "GET /taxinomies" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get taxinomies_path
      response.status.should be(200)
    end
  end
end
