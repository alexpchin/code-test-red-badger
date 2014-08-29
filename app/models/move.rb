class Move < ActiveRecord::Base
  default_scope { order('created_at ASC') }

  ORIENTATIONS = %w(n e s w)
  INSTRUCTIONS = %w(l r f)

  belongs_to :robot

  before_validation :set_status
  before_validation :already_smells?
  before_save :process_move

  # Range needs to be greater by 1 than the world max coordinate range.
  # This is so that the robot is still able to fall off.
  [:x, :y].each do |n|
    validates n, numericality: {less_than_or_equal_to: Proc.new{World::MAXSIZE+1}, greater_than_or_equal_to: Proc.new{World::MINSIZE-1}}, presence: true
  end
  validates :orientation, presence: true
  validates :status, numericality: {less_than_or_equal_to: 1, greater_than_or_equal_to: 0}, presence: true
  validate :correct_orientation?

  after_save :is_robot_lost?

  # Check if robot is lost after move
  def is_robot_lost?
    self.robot.check_if_lost_after_move(self)
  end

  # Validation orientation
  # Instead of validates_inclusion_of
  def correct_orientation?
    if !Move::ORIENTATIONS.include?(orientation)
      errors.add(:orientation, :orientation_error) 
    end
  end

  # Validation for whether there already has been a robot lost with this move
  def already_smells?
    if self.class.where(x: self.x, y: self.y, status: 0).present?
      errors.add(:base, :already_smells)
    end
  end

  # Process the move
  def process_move
    self.status = self.is_move_available? ? 1 : 0
  end

  # Check whether the move is available
  def is_move_available?
    self.robot.world.is_move_available?(self.x, self.y)
  end

  # Define possible orientations
  def self.orientations
    Move::ORIENTATIONS
  end

  # Define maximum and miminum coordinate values
  def self.range
    [*World::MINSIZE..World::MAXSIZE]
  end

  # Define possible robot move choices
  # Available after landing on world
  def self.options
    Move::INSTRUCTIONS
  end

  private
  # Status will always be 1 before validation
  # Status may change after before_save is_move_available? check
  def set_status
    self.status = 1
  end

end