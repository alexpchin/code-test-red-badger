class Robot < ActiveRecord::Base
  belongs_to  :world
  has_many    :moves

  validates :status, numericality: {less_than_or_equal_to: 1, greater_than_or_equal_to: 0}, presence: true
  validates :world_id, presence: true
  validate :prevent_multirobotics?, on: :create

  # Retrieve the robot's last co-ordinates
  [:x, :y].each do |indice|
    define_method indice do 
      moves.last.send indice if moves.present?
    end 
  end

  # Validates creating only one deployed robot at a time on a world
  def prevent_multirobotics?
    if self.world.robots.any? { |r| r.status == 1 && r.id }
      errors.add(:base, :deployed_robot)
    end
  end

  # Pass last move into method to prevent query
  # Only new moves will have a new status of 0
  def check_if_lost_after_move(move)
    (self.status = 0 and self.save!) if move.status == 0
  end

  # Count the number of moves this robot has made
  # Can only be on one planet at a time
  def count_moves
    moves.count if moves
  end

  # Retrieve the robot's last orientation
  # Moves return in ASC order because of default scope
  def current_orientation
    moves.last.orientation if moves.present?
  end

  # Combined left and right method to dry up code.
  # As orientations is an array, must cater for last/first in the array.
  def turn(direction)
    case direction
    when "right" then make_turn(1, 0)
    when "left" then make_turn(-1, -1)
    else 
      raise StandardError, "The direction needs to be left or right."
    end
  end

  # Turn the robot right
  # As orientations is an array, must cater for last in the array.
  def make_turn(move1, move2)
    new_orientation = Move.orientations[Move.orientations.index(current_orientation) + move1]
    if new_orientation.nil?
      new_orientation = Move.orientations[move2]
    end
    { orientation: new_orientation, x: x, y: y }
  end

  def forward
    coordinates = case current_orientation
    when "n" then [x, y+1]
    when "s" then [x, y-1]
    when "e" then [x+1, y]
    when "w" then [x-1, y]
    else
      raise StandardError, "Needs to be of type n, e, s, w."
    end
    { orientation: current_orientation, x: coordinates.first, y: coordinates.last }
  end

  # Choose the instruction to send to the robot
  def select_move(instruction)
    case instruction
    when "l" then self.turn("left")
    when "r" then self.turn("right")
    when "f" then self.forward
    else 
      raise StandardError, "The move needs to be of type l, r, or f."
    end
  end

end
