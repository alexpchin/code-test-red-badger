class Move < ActiveRecord::Base
  belongs_to :robot
  belongs_to :world

  validate :correct_orientation?
  validates :orientation, presence: true

  validates :status, numericality: {less_than_or_equal_to: 1, greater_than_or_equal_to: 0}, presence: true
  validates :x, numericality: {less_than_or_equal_to: 50, greater_than: 0}, presence: true
  validates :y, numericality: {less_than_or_equal_to: 50, greater_than: 0}, presence: true

  def correct_orientation?
    if !["n","s","e","w"].include?(orientation)
      errors.add(:orientation, "Please choose N, S, E or W.")
    end
  end

end
