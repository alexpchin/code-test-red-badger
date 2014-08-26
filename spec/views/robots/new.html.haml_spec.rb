require 'spec_helper'

describe "robots/new" do
  before(:each) do
    assign(:robot, stub_model(Robot,
      :status => 1,
      :world => nil
    ).as_new_record)

    @world = assign(:world, stub_model(World,
      :id => 1,
      :name => "Name",
      :x => 1,
      :y => 2
    ))
  end

  it "renders new robot form" do
    render
    assert_select "form[action=?][method=?]", world_robots_path(world_id: @world.id), "post"
  end
end
