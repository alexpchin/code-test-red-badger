class Robot < ActiveRecord::Base
  belongs_to  :world
  has_many    :moves

  validates :status, numericality: {less_than_or_equal_to: 1, greater_than_or_equal_to: 0}, presence: true

  # Pass last move into method to prevent query
  # Only new moves will have a new status of 0
  def check_if_lost_after_move(move)
    self.status = 0 if move.status == 0
    self.save
  end

  # Count the number of moves this robot has made
  # Can only be on one planet at a time
  def count_moves
    moves.count if moves
  end

  # Retrieve the robot's last orientation
  def current_orientation
    moves.last.orientation if moves.count > 0
  end

  # Retrieve the robot's last x coordinate
  def x
    moves.last.x if moves.count > 0
  end

  # Retrieve the robot's last y coordinate
  def y
    moves.last.y if moves.count > 0
  end

  # Turn the robot left
  def left
    new_orientation = Move.orientations[Move.orientations.index(current_orientation)-1]
    {orientation: new_orientation, x: x, y: y}
  end

  # Turn the robot right
  def right
    new_orientation = Move.orientations[Move.orientations.index(current_orientation)+1]
    {orientation: new_orientation, x: x, y: y}
  end

  # Move the robot forward
  def forward
    case current_orientation
    when "n"
      new_x = x + 1
      new_y = y 
    when "s"
      new_x = x - 1
      new_y = y
    when "e"
      new_x = x
      new_y = y + 1
    when "w"
      new_x = x
      new_y = y - 1
    else
      raise "error"
    end
    {orientation: current_orientation, x: new_x, y: new_y}
  end

  # Choose the instruction to send to the robot
  def select_move(instruction)
    case instruction
    when "l" then self.left
    when "r" then self.right
    when "f" then self.forward
    else raise "error"
    end
  end

end
