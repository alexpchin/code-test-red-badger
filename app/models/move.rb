class Move < ActiveRecord::Base
  belongs_to :robot
  belongs_to :world

  validates :x, numericality: {less_than_or_equal_to: 50, greater_than: 0}, presence: true
  validates :y, numericality: {less_than_or_equal_to: 50, greater_than: 0}, presence: true

  # def correct_orientation?
  #   if !["n","s","e","w"].include?(orientation)
  #     errors.add(:orientation, "Please choose N, S, E or W.")
  #   end
  # end

  def can_play?
    is_move_available?
  end

end
