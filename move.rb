class Move 
  attr_accessor :orientation, :coordinates

  def initialize(options={})
    @orientation = options[:orientation]      # Compass e.g. N,S,E,W (string)
    @coordinates = [options[:x], options[:y]] # Coordinate (array)
  end

end