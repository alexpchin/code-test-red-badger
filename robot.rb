class Robot
  attr_accessor :moves, :status
  @@count = 0
  @@instances = []
  @@compass = ["n","e","s","w"]

  def initialize(options={})
    @@count     += 1
    @@instances << self
    @moves      = []
    @status     = 1
  end

  def self.all
    @@instances.inspect
  end

  def self.count
    @@count
  end

  def current_position
    @moves.last.coordinates
  end

  def current_direction
    @moves.last.orientation
  end

  def left
    new_direction = @@compass[@@compass.index(current_direction)-1]
    @moves << Move.new({orientation: new_direction, x: current_position[0], y: current_position[1]})
    @moves.last
  end

  def right
    new_direction = @@compass[@@compass.index(current_direction)+1]
    @moves << Move.new({orientation: new_direction, x: current_position[0], y: current_position[1]})
    @moves.last
  end

  def forward(world)
    position = case current_direction
    when "n" # [+1][=]
      x = current_position[0] + 1
      y = current_position[1]      
    when "s" # [-1][=]
      x = current_position[0] - 1
      y = current_position[1]
    when "e" # [=][+1]
      x = current_position[0]
      y = current_position[1] + 1
    when "w" # [=][-1]
      x = current_position[0]
      y = current_position[1] -1
    else
      raise "error"
    end

    if world.is_move_available?(x,y) 
      @moves << Move.new({orientation: current_direction, x: x, y: y})
      @moves.last # return the last move
    elsif world.does_move_already_smell?(x,y)
      return false
    else 
      world.let_one_rip(x,y) 
      status = 0
      return "LOST"
    end

  end

end