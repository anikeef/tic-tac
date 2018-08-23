require "./square.rb"

class Grid
  attr_accessor :strings, :columns, :diagonals

  def initialize
    horizontal_lines = [1,2,3]
    vertical_lines = ["a","b","c"]
    @strings = horizontal_lines.map do |str|
      vertical_lines.map {|col| Square.new("#{col}#{str}")}
    end
    @columns = vertical_lines.map do |col|
      horizontal_lines.map {|str| Square.instances.find {|square| square.place == "#{col}#{str}"}}
    end
    @diagonals = [["a1","b2","c3"],["a3","b2","c1"]].map do |diagonal|
      diagonal.map {|place| Square.instances.find {|square| square.place == place}}
    end
  end

  def find_winner_line(lines)
    lines.find do |line|
      line.map {|square| square.state == " " ? rand : square.state}.uniq.length == 1
    end
  end
end
