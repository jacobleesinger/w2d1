require_relative 'piece.rb'
require_relative 'sliding_piece.rb'
require_relative 'stepping_piece.rb'
require_relative 'castle.rb'
require_relative 'king.rb'
require_relative 'knight.rb'
require_relative 'pawn.rb'
require_relative 'queen.rb'
require_relative 'bishop.rb'

class Board
  attr_reader :grid
  def initialize
    @grid = Array.new(8) { Array.new(8) }
    place_pieces
  end

  def place_pieces
    back_row = [Castle.new, Knight.new, Bishop.new, Queen.new,
    King.new, Bishop.new, Knight.new, Castle.new]
    @grid[0] = back_row
    @grid[1].map! { |el| el = Pawn.new }
    @grid[6].map! { |el| el = Pawn.new }
    @grid[7] = back_row.reverse
  end

  def [](pos)
    row, col = pos
    @grid[row][col]
  end

  def []=(pos, value)
    row, col = pos
    @grid[row][col] = value
  end
  
  def move(start_pos, end_pos)
    x, y = start_pos
    x2, y2 = end_pos
    fail "no piece at #{start_pos}" unless @grid[x][y]
    # fail "the piece at #{start_pos} cannot move to #{end_pos}"
    # unless the move is valid for that piece
  end
end
