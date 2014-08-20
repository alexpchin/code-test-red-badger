class Robot < ActiveRecord::Base
  belongs_to  :world
  has_many    :moves

  validates :status, numericality: {less_than_or_equal_to: 1, greater_than_or_equal_to: 0}, presence: true

  # Count the number of moves this robot has made
  # Can only be on one planet at a time
  def count_moves
    moves.count
  end

end
