require 'spec_helper'

describe "Moves" do
  before(:each) do
    World.destroy_all
    Robot.destroy_all
    Move.destroy_all
    @world   = FactoryGirl.create(:world)
    @robot   = FactoryGirl.create(:robot)
    @move_params    = FactoryGirl.attributes_for(:move)
  end

  # New
  describe "GET /worlds/:id/robots/:id/moves/new" do
    it "Get /worlds/:id/robots/:id/moves/new" do
      get new_world_robot_move_path(@world, @robot)
      response.status.should be(200)
    end
  end

  # Create
  describe "POST /worlds/:id/robots/:id/moves" do
    it "POST /worlds/:id/robots/:id/moves" do
      post world_robot_moves_path(@world, @robot, move: @move_params)
      response.status.should be(302)
    end
  end

end
