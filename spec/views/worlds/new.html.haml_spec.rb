require 'spec_helper'

describe "worlds/new" do
  before(:each) do
    assign(:world, stub_model(World,
      :name => "MyString",
      :x => 1,
      :y => 1
    ).as_new_record)
  end

  it "renders new world form" do
    render
    assert_select "form[action=?][method=?]", worlds_path, "post" do
      assert_select "input#world_name[name=?]", "world[name]"
      assert_select "select#world_x[name=?]", "world[x]"
      assert_select "select#world_y[name=?]", "world[y]"
    end
  end
end
