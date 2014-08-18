require "spec_helper"

describe RobotsController do
  describe "routing" do

    it "routes to #index" do
      get("/worlds/1/robots").should route_to("robots#index", :world_id => "1")
    end

    it "routes to #new" do
      get("/worlds/1/robots/new").should route_to("robots#new", :world_id => "1")
    end

    it "routes to #show" do
      get("/worlds/1/robots/1").should route_to("robots#show", :id => "1", :world_id => "1")
    end

    it "routes to #edit" do
      get("/worlds/1/robots/1/edit").should route_to("robots#edit", :id => "1", :world_id => "1")
    end

    it "routes to #create" do
      post("/worlds/1/robots").should route_to("robots#create", :world_id => "1")
    end

    it "routes to #update" do
      put("/worlds/1/robots/1").should route_to("robots#update", :id => "1", :world_id => "1")
    end

    it "routes to #destroy" do
      delete("/worlds/1/robots/1").should route_to("robots#destroy", :id => "1", :world_id => "1")
    end

  end
end
