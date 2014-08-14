require "spec_helper"

describe WorldsController do

  describe "GET index" do
    before(:each) do
      @worlds = 3.times.map{|t| World.create(name: "World#{t}", x: "#{1 + rand(50)}", y: "#{1 + rand(50)}")}
      get :index
    end

    it "should respond with 200 status" do
      response.status.should eq 200
    end

    it "should assign the @worlds instance variable" do
      assigns[:worlds].should eq @worlds
    end

    it "should render the index template" do
     response.should render_template(:index)
   end
  end

end