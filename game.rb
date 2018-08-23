require './player.rb'

class Game
  attr_accessor :grid
  attr_reader :player1, :player2

  def initialize
    @grid = Grid.new
    @player1 = Player.new(:x)
    @player2 = Player.new(:o)
    display_grid
  end
  def start
    players = [player1, player2]
    until (winner_line = get_winner_line)
      player = players[0]
      player.step
      display_grid
      players[0], players[1] = players[1], players[0]
    end
    winner = players.find {|player| player.symbol == winner_line[0].state}
    puts "#{winner.name}'s win!"
  end
  def display_grid
    puts "----------"
    print "  A B C\n"
    grid.strings.each.with_index(1) do |string, index|
      print "#{index} "
      string.each do |square|
        print "#{square.state} "
      end
      print "\n"
    end
    puts "----------"
  end
  def get_winner_line
      grid.find_winner_line(grid.strings) ||
      grid.find_winner_line(grid.columns) ||
      grid.find_winner_line(grid.diagonals)
  end
end

a = Game.new
a.start
