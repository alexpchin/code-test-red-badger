class Move < ActiveRecord::Base
  belongs_to :robot
  belongs_to :world

  before_validation :set_status
  before_save :process_move

  validate :correct_orientation?
  validates :orientation, presence: true
  validates :status, numericality: {less_than_or_equal_to: 1, greater_than_or_equal_to: 0}, presence: true
  # Range needs to be greater by 1 than the world coordinate range.
  validates :x, numericality: {less_than_or_equal_to: 51, greater_than_or_equal_to: -1}, presence: true
  validates :y, numericality: {less_than_or_equal_to: 51, greater_than_or_equal_to: -1}, presence: true

  # Validation orientation
  def correct_orientation?
    if !["n","s","e","w"].include?(orientation)
      errors.add(:orientation, "Please choose N, S, E or W.")
    end
  end

  # Process the move
  def process_move
    return false if already_smells?
    self.status = self.is_move_available? ? 1 : 0
  end

  # Check whether the move is available
  def is_move_available?
    world = World.find(Robot.find(self.robot_id).world_id)
    world.is_move_available?(self.x, self.y)
  end

  def already_smells?
    Move.where(x: self.x, y: self.y, status: 0).present?
  end

  # Define possible orientations
  def self.orientations
    %w(n s e w)
  end

  # Define maximum and miminum coordinate values
  # TODO: Make upper limit dynamic
  def self.range
    [*0..50]
  end

  # Define possible robot move choices
  # Available after landing on world
  def self.options
    %w(l r f)
  end

  private
  # Status will always be 1 before validation
  # Status may change after before_save is_move_available? check
  def set_status
    self.status = 1
  end

end
