require 'spec_helper'

describe "worlds/index" do
  before(:each) do
    assign(:worlds, [
      stub_model(World,
        :name => "Name",
        :x => 1,
        :y => 2
      ),
      stub_model(World,
        :name => "Name",
        :x => 1,
        :y => 2
      )
    ])
  end

  it "renders a list of worlds" do
    render
    assert_select "ul>li>a", :text => "Name".to_s, :count => 2
  end
end
