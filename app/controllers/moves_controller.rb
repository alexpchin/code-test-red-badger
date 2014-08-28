class MovesController < ApplicationController
  before_action :set_world, only: [:new, :create]
  before_action :set_robot, only: [:new, :create]
  respond_to :html

  def new 
    @move = @robot.moves.new
  end

  def create
    move = @robot.return_move(params)
    @move = @robot.moves.new(move)
    
    if @move.save
      flash[:notice] = 'Move was successfully created.'
      respond_with @world 
    else
      render :new
    end
  end

  private
    def set_world
      @world = World.find params[:world_id]
    end

    def set_robot
      @robot = Robot.find params[:robot_id]
    end

    def move_params
      params.require(:move).permit(:orientation, :x, :y)
    end
end
