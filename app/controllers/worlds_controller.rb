class WorldsController < ApplicationController
  before_action :set_world, only: [:show, :edit, :update, :destroy]

  # GET /worlds
  # GET /worlds.json
  def index
    @worlds = World.all
  end

  # GET /worlds/1
  # GET /worlds/1.json
  def show
    @robot  = @world.robots.where(status: 1).first
    @robots = @world.robots.reverse
    @moves  = @world.moves_on_world
  end

  # GET /worlds/new
  def new
    @world = World.new
  end

  # POST /worlds
  # POST /worlds.json
  def create
    @world = World.new(world_params)

    respond_to do |format|
      if @world.save
        format.html { redirect_to @world, notice: 'World was successfully created.' }
        format.json { render :show, status: :created, location: @world }
      else
        format.html { render :new }
        format.json { render json: @world.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_world
      @world = World.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def world_params
      params.require(:world).permit(:name, :x, :y)
    end
end
