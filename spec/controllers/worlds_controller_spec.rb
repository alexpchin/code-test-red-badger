require File.dirname(__FILE__) + '/../spec_helper'

describe WorldsController do

  describe 'GET index' do
    before(:each) do
      5.times.map { |w| FactoryGirl.create(:world) }
      @worlds = World.all
      get :index
    end

    it 'should respond with 200 status' do
      response.status.should eq 200
    end

    it 'should assign the @worlds instance variable' do
      assigns[:worlds].should eq @worlds
    end

    it 'should render the index template' do
      response.should render_template(:index)
    end
  end

  describe 'GET new' do
    it 'assigns a new world as @world' do
      get :new
      assigns(:world).should be_a_new(World)
    end
  end

  describe 'GET show' do
    it 'assigns the requested world as @world' do
      world = FactoryGirl.create(:world)
      get :show, {:id => world.to_param}
      assigns(:world).should eq(world)
    end
  end

  describe 'POST create' do

    describe 'with valid params' do
      it 'creates a new World' do
        expect {
          post :create, world: FactoryGirl.attributes_for(:world)
        }.to change(World, :count).by(1)
      end

      it 'assigns a newly created world as @world' do
        post :create, world: FactoryGirl.attributes_for(:world)
        assigns(:world).should be_a(World)
        assigns(:world).should be_persisted
      end

      it 'redirects to the show page that it was made on.' do
        post :create, world: FactoryGirl.attributes_for(:world)
        response.should render_template(@world)
      end
    end

    describe 'with invalid params' do
      it 'assigns a newly created but unsaved world as @world' do
        World.any_instance.stub(:save).and_return(false)
        post :create, world: FactoryGirl.attributes_for(:invalid_world)
        assigns(:world).should be_a_new(World)
      end

      it 'does not save the new world' do
        expect{
          post :create, world: FactoryGirl.attributes_for(:invalid_world)
        }.to_not change(World, :count)
      end

      it 're-renders the new template' do
        World.any_instance.stub(:save).and_return(false)
        post :create, {:world => { 'name' => nil }}
        response.should render_template('new')
      end
    end

  end

end