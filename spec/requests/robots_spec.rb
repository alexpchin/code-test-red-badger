require 'spec_helper'

describe "Robots" do
  before(:each) do
    @world   = FactoryGirl.create(:world)
    @robot_params   = FactoryGirl.attributes_for(:robot)
  end

  # New
  describe "GET /worlds/:id/robots/new" do
    it "Get /worlds/:id/robots/new" do
      get new_world_robot_path(@world)
      response.status.should be(200)
    end
  end

  # Create
  describe "POST /worlds/:id/robots" do
    it "POST /worlds/:id/robots" do
      post world_robots_path(@world, robot: @robot_params)
      response.status.should be(302)
    end
  end

end
