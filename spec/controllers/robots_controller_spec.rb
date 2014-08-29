require "spec_helper"

describe RobotsController do
  before(:each) do
    @world   = FactoryGirl.create(:world)
    @robot   = FactoryGirl.create(:robot)
  end

  describe "GET new" do
    it "assigns a new robot as @robot" do
      get :new, world_id: @world.id
      assigns(:robot).should be_a_new(Robot)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Robot" do
        expect {
          post :create, robot: FactoryGirl.attributes_for(:robot), world_id: @world.id
        }.to change(Robot, :count).by(1)
      end

      it "assigns a newly created robot as @robot" do
        post :create, robot: FactoryGirl.attributes_for(:robot), world_id: @world.id
        assigns(:robot).should be_a(Robot)
        assigns(:robot).should be_persisted
      end

      it "redirects to the created robot" do
        post :create, robot: FactoryGirl.attributes_for(:robot), world_id: @world.id
        response.should redirect_to(@world)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved robot as @robot" do
        allow_any_instance_of(Robot).to receive(:save).and_return(false)
        post :create, {:robot => { "status" => nil }, world_id: @world.id}
        expect(assigns(:robot)).to be_a_new(Robot)
      end

      it "re-renders the 'new' template" do
        Robot.any_instance.stub(:save).and_return(false)
        post :create, {:robot => { "status" => nil }, world_id: @world.id}
        response.should redirect_to(@world)
      end
    end
  end

end