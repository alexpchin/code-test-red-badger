class Move < ActiveRecord::Base
  belongs_to :robot
  belongs_to :world

  before_validation :set_status

  validate :correct_orientation?
  validates :orientation, presence: true
  validates :status, numericality: {less_than_or_equal_to: 1, greater_than_or_equal_to: 0}, presence: true
  validates :x, numericality: {less_than_or_equal_to: 50, greater_than: 0}, presence: true
  validates :y, numericality: {less_than_or_equal_to: 50, greater_than: 0}, presence: true

  # Validation orientation
  def correct_orientation?
    if !orientations.include?(orientation)
      errors.add(:orientation, "Please choose N, S, E or W.")
    end
  end

  # Define possible orientations
  def orientations
    %w(n s e w)
  end

  # TODO: Make upper limit dynamic
  def range
    [*0..50]
  end

  private
  # Check whether the move is valid
  # If it isn't valid, update the robot's status
  # Update the move's status
  def set_status
    self.status = 0
    self.status = 1
  end

end
