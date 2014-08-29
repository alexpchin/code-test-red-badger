require 'spec_helper'

describe RobotsController do
  describe 'routing' do

    it 'routes to #new' do
      get('/worlds/1/robots/new').should route_to('robots#new', :world_id => '1')
    end

    it 'routes to #create' do
      post('/worlds/1/robots').should route_to('robots#create', :world_id => '1')
    end

  end
end
