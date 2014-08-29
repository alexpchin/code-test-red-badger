require File.dirname(__FILE__) + '/../spec_helper'

describe MovesController do
  before(:each) do
    @world   = FactoryGirl.create(:world)
    @robot   = FactoryGirl.create(:robot)
    @move    = FactoryGirl.create(:move)
  end

  describe "GET new" do
    it "assigns a new move as @move" do
      get :new, {robot_id: @robot.id, world_id: @world.id}
      assigns(:move).should be_a_new(Move)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Move" do
        expect {
          post :create, move: FactoryGirl.attributes_for(:move), robot_id: @robot.id, world_id: @world.id
        }.to change(Move, :count).by(1)
      end

      it "assigns a newly created move as @move" do
        post :create, move: FactoryGirl.attributes_for(:move), robot_id: @robot.id, world_id: @world.id
        assigns(:move).should be_a(Move)
        assigns(:move).should be_persisted
      end

      it "redirects to the world that it was made on." do
        post :create, move: FactoryGirl.attributes_for(:move), robot_id: @robot.id, world_id: @world.id
        response.should redirect_to @world
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved move as @move" do
        Move.any_instance.stub(:save).and_return(false)
        post :create, {:move => { "orientation" => "invalid value" }, robot_id: @robot.id, world_id: @world.id }
        assigns(:move).should be_a_new(Move)
      end

      it "re-renders the 'new' template" do
        Move.any_instance.stub(:save).and_return(false)
        post :create, {:move => { "orientation" => "invalid value" }, robot_id: @robot.id, world_id: @world.id }
        response.should render_template("new")
      end
    end
  end

end