require "spec_helper"

describe TaxinomiesController do
  describe "routing" do

    it "routes to #index" do
      get("/taxinomies").should route_to("taxinomies#index")
    end

    it "routes to #new" do
      get("/taxinomies/new").should route_to("taxinomies#new")
    end

    it "routes to #show" do
      get("/taxinomies/1").should route_to("taxinomies#show", :id => "1")
    end

    it "routes to #edit" do
      get("/taxinomies/1/edit").should route_to("taxinomies#edit", :id => "1")
    end

    it "routes to #create" do
      post("/taxinomies").should route_to("taxinomies#create")
    end

    it "routes to #update" do
      put("/taxinomies/1").should route_to("taxinomies#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/taxinomies/1").should route_to("taxinomies#destroy", :id => "1")
    end

  end
end
