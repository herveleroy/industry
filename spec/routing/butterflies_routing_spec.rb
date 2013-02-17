require "spec_helper"

describe ButterfliesController do
  describe "routing" do

    it "routes to #index" do
      get("/butterflies").should route_to("butterflies#index")
    end

    it "routes to #new" do
      get("/butterflies/new").should route_to("butterflies#new")
    end

    it "routes to #show" do
      get("/butterflies/1").should route_to("butterflies#show", :id => "1")
    end

    it "routes to #edit" do
      get("/butterflies/1/edit").should route_to("butterflies#edit", :id => "1")
    end

    it "routes to #create" do
      post("/butterflies").should route_to("butterflies#create")
    end

    it "routes to #update" do
      put("/butterflies/1").should route_to("butterflies#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/butterflies/1").should route_to("butterflies#destroy", :id => "1")
    end

  end
end
