class World
  attr_accessor :name, :x, :y, :robots, :available_moves, :smells

  def initialize(options={})
    @name   = options[:name]
    @x      = options[:x]
    @y      = options[:y]
    @robots = {}
    @available_moves = generate_available_moves # (Array)
    @smells = []
  end

  def number_of_available_moves
    (@x * @y * 4) - (@x * 2 + @y * 2)
  end

  # This method generates a multi-dimensional array
  # That represents all of the moves in the world area
  # he lower-left coords are assumed to be 0, 0.
  def generate_available_moves
    row, col = [*0..@x], [*0..@y]       
    row.map { |r| ([r]*(@y+1)).zip(col) }
  end

  # Check if move is available on the current world
  def is_move_available?(x,y)
    available_moves.each do |row| 
      return true if row.include?([x,y])
    end
    return false
  end

  # Does move already smell?
  def does_move_already_smell?(x,y)
    @smells.include?([x,y])
  end

  # Make smell to warn robots
  def let_one_rip(x,y)
    @smells << [x,y]
  end

  # Quick hack to display visible grid
  def display_grid
    available_moves.map { |row| row.inspect }
  end

end
