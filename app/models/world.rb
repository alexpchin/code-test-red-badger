class World < ActiveRecord::Base
  has_many :robots
  has_many :moves

  validates :name, uniqueness: true, format: { with: /\A[a-zA-Z0-9]+\Z/ }, allow_blank: false
  validates :name, presence: true
  validates :name, length: { minimum: 1, maximum: 30 }

  validates :x, numericality: {less_than_or_equal_to: 50, greater_than: 0}, presence: true
  validates :y, numericality: {less_than_or_equal_to: 50, greater_than: 0}, presence: true

  # Method to check whether there already is a robot deployed on the planet.
  def deployed_robot?
    robots.any? { |robot| robot.status == 1 }
  end

  # Limit the range of the world co-ordinates
  def range
    [*0..50]
  end

  # Returns the moves made by robots on world
  def moves_on_world
    robots.map(&:moves).flatten!
  end

  # Returns the count of the number of moves made on world
  def count_total_moves_on_world
    moves_on_world.count
  end

  # Calculate the number of moves available on the planet.
  # Well actually, the number of squares rather than moves.
  def number_of_available_squares
    (x * y * 4) - (x * 2 + y * 2)
  end

  # This method generates a multi-dimensional array
  # That represents all of the moves in the world area
  # he lower-left coords are assumed to be 0, 0.
  def available_moves
    row, col = [*0..x], [*0..y]       
    row.map { |r| ([r]*(y+1)).zip(col) }
  end

  # Check if move is available on the current world
  def is_move_available?
    available_moves.each do |row| 
      return true if row.include?([x,y])
    end
    return false
  end

  # Does move already smell?
  def does_move_already_smell?(x,y)
    smells.include?([x,y])
  end

  # Make smell to warn robots
  def let_one_rip(x,y)
    smells << [x,y]
  end

  # Quick hack to display visible grid
  def display_grid
    available_moves.map { |row| row.inspect }
  end

end
