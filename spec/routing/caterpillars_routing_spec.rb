require "spec_helper"

describe CaterpillarsController do
  describe "routing" do

    it "routes to #index" do
      get("/caterpillars").should route_to("caterpillars#index")
    end

    it "routes to #new" do
      get("/caterpillars/new").should route_to("caterpillars#new")
    end

    it "routes to #show" do
      get("/caterpillars/1").should route_to("caterpillars#show", :id => "1")
    end

    it "routes to #edit" do
      get("/caterpillars/1/edit").should route_to("caterpillars#edit", :id => "1")
    end

    it "routes to #create" do
      post("/caterpillars").should route_to("caterpillars#create")
    end

    it "routes to #update" do
      put("/caterpillars/1").should route_to("caterpillars#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/caterpillars/1").should route_to("caterpillars#destroy", :id => "1")
    end

  end
end
