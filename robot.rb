class Robot
  attr_accessor :moves
  @@count = 0
  @@instances = []
  @@compass = ["N","E","S","W"]

  def initialize(options={})
    @@count           += 1
    @@instances       << self
    @moves            = []
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

  def move instruction
    case instruction
    when "r" then left
    when "l" then right
    when "f" then forward
    else
      raise "error"
    end
  end

  def left
    new_direction = @@compass[@@compass.index(current_direction)+1]
    @moves << Move.new({orientation: new_direction, x: current_position[0], y: current_position[1]})
    @moves.last
  end

  def right
    new_direction = @@compass[@@compass.index(current_direction)-1]
    @moves << Move.new({orientation: new_direction, x: current_position[0], y: current_position[1]})
    @moves.last
  end

  def forward
    case current_direction
    when "N" # [+1][=]
      @moves << Move.new({orientation: current_direction, x: current_position[0] + 1, y: current_position[1]})
    when "S" # [-1][=]
      @moves << Move.new({orientation: current_direction, x: current_position[0] - 1, y: current_position[1]})
    when "E" # [=][+1]
      @moves << Move.new({orientation: current_direction, x: current_position[0], y: current_position[1] + 1})
    when "W" # [=][-1]
      @moves << Move.new({orientation: current_direction, x: current_position[0], y: current_position[1] -1})
    else
      raise "error"
    end  
  end

end