require "./grid.rb"

class Player
  attr_reader :symbol, :name

  def initialize(symbol)
    @symbol = symbol
    print symbol == :x ? "Cross player's name: " : "Zero player's name: "
    @name = gets.chomp
  end
  def step
    print "#{name}'s step(e.g. a1): "
    choice = gets.chomp
    square = Square.instances.find {|square| square.place == choice}
    unless square && square.state == " "
      puts "Choose only empty squares!"
      step
      return
    end
    square.state = symbol
  end
end
