class MovesController < ApplicationController
  before_action :set_world, only: [:new, :create]
  before_action :set_robot, only: [:new, :create]

  # GET /moves/new
  def new 
    @move = @robot.moves.new
  end

  # POST /moves
  # POST /moves.json
  def create
    if params.has_key?(:robot_instruction)
      @move = @robot.moves.new(@robot.select_move(params[:robot_instruction]))
    else
      @move = @robot.moves.new(move_params)
    end

    respond_to do |format|
      if @move.save
        @robot.check_if_lost_after_move(@move)
        format.html { redirect_to @world, notice: 'Move was successfully created.' }
        format.json { render :show, status: :created, location: @move }
      else
        format.html { render :new, notice: 'That move smells.'  }
        format.json { render json: @move.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_world
      @world = World.find params[:world_id]
    end

    def set_robot
      @robot = Robot.find params[:robot_id]
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def move_params
      params.require(:move).permit(:orientation, :x, :y)
    end
end
