# The surface of mars is a rectangular grid.
# You must record the sequence of robot moves
# Report the final position of the robot


Position
- Grid co-ordinate (e.g. x,y)
- Orientation (N,S,E,W)

Robot move methods
- Left (changes the orientation, 90 degrees left)
- Right (changes the orientation, 90 degrees right)
- Forward (changes the co-ordinate value)


North corresponds to the direction from grid point (x, y) to grid point (x, y+1).

CREATE THE WORLD
The first line of input is the upper-right coordinates of the rectangular world, the lower-left coordinates are assumed to be 0, 0.

world.new(x,y)

The maximum value for any coordinate is 50.
All instruction strings will be less than 100 characters in length.

The Output
For each robot position/instruction in the input, the output should indicate the final grid position and orientation of the robot. If a robot falls off the edge of the grid the word “LOST” should be printed after the position and orientation.