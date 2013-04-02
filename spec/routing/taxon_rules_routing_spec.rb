require "spec_helper"

describe TaxonRulesController do
  describe "routing" do

    it "routes to #index" do
      get("/taxon_rules").should route_to("taxon_rules#index")
    end

    it "routes to #new" do
      get("/taxon_rules/new").should route_to("taxon_rules#new")
    end

    it "routes to #show" do
      get("/taxon_rules/1").should route_to("taxon_rules#show", :id => "1")
    end

    it "routes to #edit" do
      get("/taxon_rules/1/edit").should route_to("taxon_rules#edit", :id => "1")
    end

    it "routes to #create" do
      post("/taxon_rules").should route_to("taxon_rules#create")
    end

    it "routes to #update" do
      put("/taxon_rules/1").should route_to("taxon_rules#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/taxon_rules/1").should route_to("taxon_rules#destroy", :id => "1")
    end

  end
end
