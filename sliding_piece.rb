class SlidingPiece < Piece


  def horizontal_and_vertical
    [[-1, 0], [0, -1], [0, 1], [1, 0]]
  end

  def diagonal
    [[-1, -1], [-1, 1], [1, -1], [1, 1]]
  end

  def horizontal_and_vertical_moves
    moves = []
    horizontal_and_vertical.each do |row, col|
      x, y = @position
      while on_board?(x, y)
        x, y = x + row, y + col
        move = [x, y]
        moves << move if valid_move?(move)
      end
    end
    moves
  end
  
end
