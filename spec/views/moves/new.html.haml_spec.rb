require 'spec_helper'

describe "moves/new" do
  before(:each) do
    assign(:move, stub_model(Move,
      :orientation => %w(n e s w).sample,
      :x => 1,
      :y => 1,
      :status => 1,
      :robot => nil
    ).as_new_record)

    @robot = assign(:robot, stub_model(Robot,
      :id => 1,
      :status => 1,
      :world => nil
    ))

    @world = assign(:world, stub_model(World,
      :name => "Name",
      :x => 1,
      :y => 2
    ))
  end

  it "renders new move form" do
    render
    assert_select "form[action=?][method=?]", world_robot_moves_path(world_id: @world.id, robot_id: @robot.id), "post" do
      assert_select "select#move_orientation[name=?]", "move[orientation]"
      assert_select "select#move_x[name=?]", "move[x]"
      assert_select "select#move_y[name=?]", "move[y]"
    end
  end
end
