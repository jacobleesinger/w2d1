class Castle < SlidingPiece
  def initialize
    @token = "[C]"
  end

  def possible_moves
    moves = []
    
  end

  def row
    @board.grid[@position[0]]
  end

  def column
    transposed_grid = @board.grid.transpose
    transposed_grid[@position[1]]
  end
end
