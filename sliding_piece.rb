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
      x, y = @position.dup
      x, y = x + row, y + col
      tile = @board.grid[x][y]
      while can_occupy?(x, y)
                                            #will need to be able to
                                            #move to enemy pieces somehow
        move = [x, y]
        moves << move if valid_move?(move)
        x, y = x + row, y + col
      end

    end
    moves
  end

  def can_occupy?(x, y)
    return false unless on_board?([x, y])
    @board.grid[x][y].nil?
  end

  def diagonal_moves
    moves = []
    diagonal.each do |row, col|
      x, y = @position.dup
      x, y = x + row, y + col
      tile = @board.grid[x][y]
      while can_occupy?(x, y)
        move = [x, y]
        moves << move if valid_move?(move)
        x, y = x + row, y + col
      end
    end
    moves
  end

end
