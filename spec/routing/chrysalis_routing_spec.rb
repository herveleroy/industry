require "spec_helper"

describe ChrysalisController do
  describe "routing" do

    it "routes to #index" do
      get("/chrysalis").should route_to("chrysalis#index")
    end

    it "routes to #new" do
      get("/chrysalis/new").should route_to("chrysalis#new")
    end

    it "routes to #show" do
      get("/chrysalis/1").should route_to("chrysalis#show", :id => "1")
    end

    it "routes to #edit" do
      get("/chrysalis/1/edit").should route_to("chrysalis#edit", :id => "1")
    end

    it "routes to #create" do
      post("/chrysalis").should route_to("chrysalis#create")
    end

    it "routes to #update" do
      put("/chrysalis/1").should route_to("chrysalis#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/chrysalis/1").should route_to("chrysalis#destroy", :id => "1")
    end

  end
end
