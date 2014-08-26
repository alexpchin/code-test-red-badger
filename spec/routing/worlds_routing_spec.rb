require "spec_helper"

describe WorldsController do
  describe "routing" do

    it "routes to #index" do
      get("/worlds").should route_to("worlds#index")
    end

    it "routes to #new" do
      get("/worlds/new").should route_to("worlds#new")
    end

    it "routes to #show" do
      get("/worlds/1").should route_to("worlds#show", :id => "1")
    end

    it "routes to #create" do
      post("/worlds").should route_to("worlds#create")
    end

  end
end
