class SlidingPiece < Piece

  def horizontal
    @board.grid[@position[0]]
  end

  def vertical
    @board.grid.transpose[@position[1]]
  end

  def left_diagonal(pos)
    x, y = pos
    i = 1
    j = 1
    left = [[x - i, y - j], [x + i, y + j]]
    left_diagonal = []
    until left_diagonal.length == 8
      left_diagonal << left
      i += 1
      j += 1
    end
    left_diagonal
  end

  def right_diagonal(pos)
    x, y = pos
    i = 1
    j = 1

    right = [[x - i, y + j], [x + i, y - j]]
    right_diagonal = []
    until right_diagonal.length == 8
      right_diagonal << right
      i += 1
      j += 1
    end
  end
  
end
