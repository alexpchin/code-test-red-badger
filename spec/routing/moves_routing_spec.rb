require "spec_helper"

describe MovesController do
  describe "routing" do

    it "routes to #index" do
      get("/worlds/1/robots/1/moves").should route_to("moves#index", :world_id => "1", :robot_id => 1)
    end

    it "routes to #new" do
      get("/worlds/1/robots/1/moves/new").should route_to("moves#new", :world_id => "1", :robot_id => 1)
    end

    it "routes to #show" do
      get("/worlds/1/robots/1/moves/1").should route_to("moves#show", :id => "1", :world_id => "1", :robot_id => 1)
    end

    it "routes to #edit" do
      get("/worlds/1/robots/1/moves/1/edit").should route_to("moves#edit", :id => "1", :world_id => "1", :robot_id => 1)
    end

    it "routes to #create" do
      post("/worlds/1/robots/1/moves").should route_to("moves#create", :world_id => "1", :robot_id => 1)
    end

    it "routes to #update" do
      put("/worlds/1/robots/1/moves/1").should route_to("moves#update", :id => "1", :world_id => "1", :robot_id => 1)
    end

    it "routes to #destroy" do
      delete("/worlds/1/robots/1/moves/1").should route_to("moves#destroy", :id => "1", :world_id => "1", :robot_id => 1)
    end

  end
end
