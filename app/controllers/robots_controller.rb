class RobotsController < ApplicationController
  before_action :set_world, only: [:new, :create]

  # GET /robots/new
  def new
    @robot = @world.robots.new
  end

  # POST /robots
  # POST /robots.json
  def create
    @robot = @world.robots.new

    respond_to do |format|
      if @robot.save
        format.html { redirect_to @world, notice: 'Robot was successfully created.' }
        format.json { redirect_to @world, status: :created }
      else
        format.html { render :new }
        format.json { render json: @robot.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_world
      @world = World.find params[:world_id]
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def robot_params
      params.require(:robot).permit(:status, :world_id)
    end
end
