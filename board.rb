require_relative 'piece.rb'

class Board
  attr_reader :grid
  def initialize
    @grid = Array.new(8) { Array.new(8) }
    place_pieces
  end

  def place_pieces
    @grid[0].map! { |el| el = Piece.new }
    @grid[1].map! { |el| el = Piece.new }
    @grid[6].map! { |el| el = Piece.new }
    @grid[7].map! { |el| el = Piece.new }
  end

  def move(start_pos, end_pos)
    x, y = start_pos
    x2, y2 = end_pos
    fail "no piece at #{start_pos}" unless @grid[x][y]
    # fail "the piece at #{start_pos} cannot move to #{end_pos}"
    # unless the move is valid for that piece
  end
end
