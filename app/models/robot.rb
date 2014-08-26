class Robot < ActiveRecord::Base
  belongs_to  :world
  has_many    :moves

  validates :status, numericality: {less_than_or_equal_to: 1, greater_than_or_equal_to: 0}, presence: true
  validates :world_id, presence: true
  validate :prevent_multirobotics?, on: :create

  # Validates creating only one deployed robot at a time on a world
  def prevent_multirobotics?
    robots = Robot.where world_id: self.world_id 
    if robots.any? { |robot| robot.status == 1 }
      errors.add(:base, :deployed_robot)
    end
  end

  # Pass last move into method to prevent query
  # Only new moves will have a new status of 0
  def check_if_lost_after_move(move)
    if move.status == 0
      self.status = 0
      self.save!
    end
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
  # As orientations is an array, must cater for last in the array.
  def left
    new_orientation = Move.orientations[Move.orientations.index(current_orientation)-1]
    if new_orientation.nil?
      new_orientation = Move.orientations[-1]
    end
    {orientation: new_orientation, x: x, y: y}
  end

  # Turn the robot right
  # As orientations is an array, must cater for last in the array.
  def right
    new_orientation = Move.orientations[Move.orientations.index(current_orientation)+1]
    if new_orientation.nil?
      new_orientation = Move.orientations[0]
    end
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
