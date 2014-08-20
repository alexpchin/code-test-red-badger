module RobotsHelper

  # Show the status of the robot as a string
  def display_status(robot)
    robot.status == 1 ? "DEPLOYED" : "LOST"
  end

end
