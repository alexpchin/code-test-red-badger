class WorldsController < ApplicationController
  before_action :set_world, only: [:show]
  respond_to :html

  def index
    @worlds = World.all
  end

  def show
    @robot  = @world.robots.where(status: 1).first
    @robots = @world.robots.reverse if @world.robots.present?
    @moves  = @world.moves_on_world
  end

  def new
    @world = World.new
  end

  def create
    @world = World.new(world_params)
    flash[:notice] = 'World was successfully created.' if @world.save
    respond_with @world
  end

  private
    def set_world
      @world = World.find(params[:id])
    end

    def world_params
      params.require(:world).permit(:name, :x, :y)
    end
end
