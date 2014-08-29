require 'spec_helper'

describe MovesController do
  describe 'routing' do

    it 'routes to #new' do
      get('/worlds/1/robots/1/moves/new').should route_to('moves#new', :world_id => '1', :robot_id => '1')
    end

    it 'routes to #create' do
      post('/worlds/1/robots/1/moves').should route_to('moves#create', :world_id => '1', :robot_id => '1')
    end

  end
end
