class MovesController < ApplicationController
  before_action :set_move, only: [:show, :edit, :update, :destroy]

  # GET /moves
  # GET /moves.json
  def index
    @moves = Move.all
  end

  # GET /moves/new
  def new
    @world = World.find params[:world_id]
    @robot = Robot.find params[:robot_id]
    @move = @robot.moves.new
  end

  # POST /moves
  # POST /moves.json
  def create
    @world = World.find params[:world_id]
    @robot = @world.robots.find params[:robot_id]

    if params.has_key?(:robot_instruction)
      @move = @robot.moves.new(@robot.select_move(params[:robot_instruction]))
    else
      @move = @robot.moves.new(move_params)
    end

    respond_to do |format|
      if @move.save
        @robot.check_if_lost_after_move(@move)
puts "#{@robot} ****************************************************************"

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
    def set_move
      @move = Move.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def move_params
      params.require(:move).permit(:orientation, :x, :y)
    end
end
