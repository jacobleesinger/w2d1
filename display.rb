require 'colorize'
require_relative 'cursorable.rb'
require_relative 'board.rb'
require_relative 'piece.rb'
require 'byebug'
class Display
  include Cursorable

# [C][H][B][Q][K][B][H][C]
# [p][p][p][p][p][p][p][p]
# [ ][ ][ ][ ][ ][ ][ ][ ]
# [ ][ ][ ][ ][ ][ ][ ][ ]
# [ ][ ][ ][ ][ ][ ][ ][ ]
# [ ][ ][ ][ ][ ][ ][ ][ ]
# [p][p][p][p][p][p][p][p]
# [C][H][B][K][Q][B][H][C]

  attr_accessor :cursor, :board

  def initialize(board = Board.new)
    @board = board
    @cursor_pos = [0, 0]
    render
  end

  def move_cursor
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
    @board.grid.map.with_index do |row, i|
      build_row(row, i)
    end
  end

  def build_row(row, i)
    row.map.with_index do |tile, j|
      color_options = colors_for(i, j)
      if tile.is_a?(Piece)
        tile.to_s.colorize(color_options)
      else
        "[ ]".colorize(color_options)
      end


    end
  end

  def colors_for(i, j)
    if [i, j] == @cursor_pos
      bg = :yellow
    elsif (i + j).odd?
      bg = :light_blue
    else
      bg = :blue
    end
    { background: bg, color: :white }
  end

end
