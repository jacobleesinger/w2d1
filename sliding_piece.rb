class SlidingPiece < Piece

# didn't have much success with the search the whole row/column and drop off  invalid moves idea, now trying to search outward from piece for valid moves in a given set of directions.
  def straight
    [[-1, 0], [0, -1], [0, 1], [1, 0]]
  end

  def diagonal
    [[-1, -1], [-1, 1], [1, -1], [1, 1]]
  end

  def straight_moves
    moves = []
    straight.each do |row, col|
      x, y = @position
      while on_board?([x, y])
        x, y = x + row, y + col
        move = [x, y]
        moves << move if valid_move?(move)
      end
    end
    moves
  end

  def diagonal_moves
    moves = []
    diagonal.each do |row, col|
      x, y = @position
      while on_board?([x, y])
        x, y = x + row, y + col
        move = [x, y]
        moves << move if valid_move?(move)
      end
    end
    moves
  end

end
