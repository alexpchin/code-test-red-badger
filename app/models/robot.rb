class Robot < ActiveRecord::Base
  belongs_to  :world
  has_many    :moves

  validates :status, numericality: {less_than_or_equal_to: 1, greater_than_or_equal_to: 0}, presence: true
  validates :world_id, presence: true
  validate :prevent_multirobotics?, on: :create

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
  # Moves return in DESC order so .first is the last
  def current_orientation
    moves.first.orientation if moves.present?
  end

  # Retrieve the robot's last x coordinate
  def x
    moves.first.x if moves.present?
  end

  # Retrieve the robot's last y coordinate
  def y
    moves.first.y if moves.present?
  end

  ## Meta class to dry up code?
  # class << self
  #   [:x, :y].each do |indice|
  #     define_method indice do 
  #       moves.first.send indice if moves.present?
  #     end 
  #   end
  # end

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

  def forward
    coordinates = case current_orientation
    when "n" then [x, y+1]
    when "s" then [x, y-1]
    when "e" then [x+1, y]
    when "w" then [x-1, y]
    else
      raise StandardError, "Needs to be of type n, e, s, w."
    end
    {orientation: current_orientation, x: coordinates.first, y: coordinates.last}
  end

  # Choose the instruction to send to the robot
  def select_move(instruction)
    case instruction
    when "l" then self.left
    when "r" then self.right
    when "f" then self.forward
    else 
      raise StandardError, "The move needs to be of type l, r, or f."
    end
  end

end
