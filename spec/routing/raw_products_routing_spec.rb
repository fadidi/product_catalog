require "spec_helper"

describe RawProductsController do
  describe "routing" do

    it "routes to #index" do
      get("/raw_products").should route_to("raw_products#index")
    end

    it "routes to #new" do
      get("/raw_products/new").should route_to("raw_products#new")
    end

    it "routes to #show" do
      get("/raw_products/1").should route_to("raw_products#show", :id => "1")
    end

    it "routes to #edit" do
      get("/raw_products/1/edit").should route_to("raw_products#edit", :id => "1")
    end

    it "routes to #create" do
      post("/raw_products").should route_to("raw_products#create")
    end

    it "routes to #update" do
      put("/raw_products/1").should route_to("raw_products#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/raw_products/1").should route_to("raw_products#destroy", :id => "1")
    end

  end
end
