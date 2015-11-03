require 'colorize'
require_relative 'cursorable.rb'
require_relative 'board.rb'
require_relative 'piece.rb'
require 'byebug'
class Display
  include Cursorable

  attr_accessor :cursor, :board

  def initialize(board = Board.new)
    @board = board
    @cursor_pos = [0, 0]
    render
  end

  def move
    result = nil
    until result
      render
      # debugger
      result = get_input
    end
    result
  end

  def render
    system("clear")
    puts""
    puts "Arrow keys, WASD, or vim to move, space or enter to confirm."
    build_grid.each { |row| puts row.join }
  end


  def build_grid
    @board.map.with_index do |row, i|
      build_row(row, i)
    end
  end

  def build_row(row, i)
    row.map.with_index do |piece, j|
      color_options = colors_for(i, j)
      piece.to_s.colorize(color_options)
    end
  end

  def colors_for(i, j)
    if [i, j] == @cursor_pos
      bg = :light_red
    elsif (i + j).odd?
      bg = :light_blue
    else
      bg = :blue
    end
    { background: bg, color: :white }
  end

end

if __FILE__ == $PROGRAM_NAME
  b = Board.new
  a = Display.new(b.grid)
  a.move
end
