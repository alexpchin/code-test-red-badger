require 'pry-byebug'

require_relative 'world'
require_relative 'robot'
require_relative 'move'

puts `clear`

# Create a world
puts "Please define the co-ordinates of the word."
puts "Please enter the x co-ordinate first:"
x = gets.chomp.to_i
puts "Now, please enter the y co-ordinate:"
y = gets.chomp.to_i
puts "Please enter a name for your new world:"
name = gets.chomp.to_s
world = World.new({name: name, x: x, y: y})
puts "Welcome to your new world #{world.name}"
puts world.display_grid

# Create a robot
puts "Deploying robot to #{world.name}"
robot = Robot.new
robot_id = Robot.count
world.robots[:robot_id] = robot

# Land the robot
puts "Robot id: #{Robot.count} is now landing on #{world.name}"
puts "Where do you want the robot to land?"
puts "Please enter the x co-ordinate:"
x = gets.chomp.to_i
puts "Now, please enter the y co-ordinate:"
y = gets.chomp.to_i
puts "Please enter the direction you want the robot to face (N,S,E,W):"
orientation = gets.chomp.to_s
# DateTime.now
robot.moves << Move.new({orientation: orientation, x: x, y: y})
puts "Your robot has now landed on #{world.name} at position, #{x},#{y} facing #{orientation}"
puts robot.moves.last.inspect
puts robot.current_position.inspect

# Make a move
puts "The robot is requesting instructions from Earth..."
puts "Please give the robot an instruction (L,R,F)"
input = gets.chomp.to_s.downcase!
puts robot.move(input).inspect

# Make a move
puts "The robot is requesting instructions from Earth..."
puts "Please give the robot an instruction (L,R,F)"
input = gets.chomp.to_s.downcase!
puts robot.move(input).inspect


# binding.pry