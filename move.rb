class Move 
  attr_accessor :orientation, :coordinates

  def initialize(options={})
    @orientation = options[:orientation]      # Compass e.g. N,S,E,W (String)
    @coordinates = [options[:x], options[:y]] # Coordinate (Array)
  end

end