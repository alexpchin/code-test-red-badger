# Game methods

def show_number_of_moves(world)
  puts "This world has #{world.number_of_available_moves} posible moves."
end

# x-coordinate
# y-coordinate
# name
# Creates a world object 
def create_world
  puts "Please define the boundary of the world."
  puts "Please enter the x co-ordinate first:"
  x = gets.chomp.to_i
  puts "Now, please enter the y co-ordinate:"
  y = gets.chomp.to_i
  puts "Please enter a name for your new world:"
  name = gets.chomp.downcase.to_s
  world = World.new({name: name, x: x, y: y})
  puts "Welcome to your new world called, #{world.name.capitalize}"
  show_number_of_moves(world)
  world
end

# Creates a robot object
def create_robot(world)
  robot = Robot.new
  robot_id = Robot.count
  world.robots[:robot_id] = robot
  robot
end

# x-coordinate
# y-coordinate
# orientation
# Creates an initial move
def land_robot(world, robot)
  puts "Where do you want the robot to land?"
  puts "Please enter the x co-ordinate:"
  x = gets.chomp.to_i
  puts "Now, please enter the y co-ordinate:"
  y = gets.chomp.to_i
  puts "Please enter the direction you want the robot to face (N,S,E,W):"
  orientation = gets.chomp.downcase.to_s
  robot.moves << Move.new({orientation: orientation, x: x, y: y})
  puts "Your robot has now landed on #{world.name} at position, #{x},#{y} facing #{orientation}"
  puts robot.moves.last.inspect
  puts robot.current_position.inspect
end

def send_command(world, robot)
  puts "Robot status: #{robot.status}"
  puts "The robot is requesting instructions from Earth..."
  puts "Please give the robot an instruction (L,R,F)"
  instruction = gets.chomp.downcase.to_s

  position = case instruction
  when "r" then robot.right
  when "l" then robot.left
  when "f" then robot.forward(world)
  else
    raise "error"
  end
  puts position.inspect
  send_command(world, robot) unless position == "LOST" 
end

def play_game(world)
  if Robot.count > 0
    puts "Do you want to continue playing? (y/n)" 
    input = gets.chomp.downcase.to_s
    return false if input == "n"
  end

  # Create a robot
  puts "Deploying robot to #{world.name}"
  robot = create_robot(world)

  # Land the robot
  land_robot(world, robot)

  # Select a move
  send_command(world, robot) unless robot.status == 0

  puts world.smells.inspect

  play_game(world)
end