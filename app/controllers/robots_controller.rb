class RobotsController < ApplicationController
  before_action :set_robot, only: [:show, :edit, :update, :destroy]

  # GET /robots/new
  def new
    @world = World.find params[:world_id]
    @robot = @world.robots.new
  end

  # POST /robots
  # POST /robots.json
  def create
    @world = World.find params[:world_id]
    @robot = @world.robots.new(params[:id])

    unless @world.deployed_robot?
      respond_to do |format|
        if @robot.save
          format.html { redirect_to @world, notice: 'Robot was successfully created.' }
          format.json { render :show, status: :created, location: @robot }
        else
          format.html { render :new }
          format.json { render json: @robot.errors, status: :unprocessable_entity }
        end
      end
    else 
      respond_to do |format|
        format.html { redirect_to @world, notice: 'You already have a robot deployed!' }
        format.json { render json: @robot.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /robots/1
  # PATCH/PUT /robots/1.json
  def update
    respond_to do |format|
      if @robot.update(robot_params)
        format.html { redirect_to @robot, notice: 'Robot was successfully updated.' }
        format.json { render :show, status: :ok, location: @robot }
      else
        format.html { render :edit }
        format.json { render json: @robot.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /robots/1
  # DELETE /robots/1.json
  def destroy
    @robot.destroy
    respond_to do |format|
      format.html { redirect_to robots_url, notice: 'Robot was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_robot
      @robot = Robot.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def robot_id_params
      params.require(:robot).permit(:status, :world_id)
    end
end
