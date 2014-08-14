require 'pry-byebug'

require_relative 'world'
require_relative 'robot'
require_relative 'move'
require_relative 'methods'

puts `clear`

# Create a world
world = create_world
puts world.display_grid

# Play game
play_game(world)

# binding.pry