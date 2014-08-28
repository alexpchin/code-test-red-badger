class RobotsController < ApplicationController
  before_action :set_world, only: [:new, :create]
  respond_to :html

  def new
    @robot = @world.robots.new
  end

  def create
    @robot = @world.robots.new
    flash[:notice] = 'Robot was successfully deployed.' and redirect_to @world if @robot.save
    render :new if !@robot.save
  end

  private
    def set_world
      @world = World.find params[:world_id]
    end

    def robot_params
      params.require(:robot).permit(:status, :world_id)
    end
end
