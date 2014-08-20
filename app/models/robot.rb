class Robot < ActiveRecord::Base
  belongs_to  :world
  has_many    :moves

  validates :status, numericality: {less_than_or_equal_to: 1, greater_than_or_equal_to: 0}, presence: true

  # Count the number of moves this robot has made
  # Can only be on one planet at a time
  def count_moves
    moves.count
  end

  # Retrieve the robot's last orientation
  def current_orientation
    moves.last.orientation
  end

  # Retrieve the robot's last x co-ordinate
  def x
    moves.last.x
  end

  # Retrieve the robot's last y co-ordinate
  def y
    moves.last.y
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

end
