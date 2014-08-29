require File.dirname(__FILE__) + '/../spec_helper'

describe 'Worlds' do
  before(:each) do
    @world   = FactoryGirl.create(:world)
    @world_params = FactoryGirl.attributes_for(:world)
  end

  # Index
  describe 'GET /worlds' do
    it 'Get /worlds' do
      get worlds_path
      response.status.should be(200)
    end
  end

  # New
  describe 'GET /worlds/new' do
    it 'Get /worlds/new' do
      get new_world_path
      response.status.should be(200)
    end
  end

  # Show
  describe 'GET /worlds/:id' do
    it 'Get /worlds/:id' do
      get world_path(@world)
      response.status.should be(200)
    end
  end

  # Create
  describe 'POST /worlds/' do
    it 'POST /worlds' do
      post worlds_path(world: @world_params)
      response.status.should be(302)
    end
  end
end
