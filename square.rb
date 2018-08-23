class Square
  attr_reader :place
  attr_accessor :state

  @@instances = []
  def self.instances
    @@instances
  end

  def initialize(place)
    @state = " "
    @place = place
    Square.instances << self
  end
end
