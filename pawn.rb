class Pawn < Piece
  def to_s
    "[p]"
  end

  def basic_moves
    x, y = @position.dup
    moves = []
    moves << [x+1, y] if self.team == "top" && can_occupy?([x+1, y])
    moves << [x-1, y] if self.team == "bottom" && can_occupy?([x-1, y])
    moves
  end

  def possible_moves
    x, y = @position.dup
    moves = basic_moves
    p moves

    #if diagonals are enemies...
    if self.team == "top"
      enemy1 = @board.grid[x+1][y+1]
      enemy2 = @board.grid[x+1][y-1]
      moves << [x+1, y+1] if on_board?([x+1, y+1]) && enemy1.team != self.team
      moves << [x+1, y-1] if on_board?([x+1, y-1]) && enemy2.team != self.team
    end

    if self.team == "bottom"
      enemy1 = @board.grid[x-1][y-1]
      enemy2 = @board.grid[x-1][y+1]
      moves << [x-1, y-1] if on_board?([x-1, y-1]) && enemy1.team != self.team
      moves << [x-1, y+1] if on_board?([x-1, y+1]) && enemy2.team != self.team
    end

    unless self.has_moved
      moves << [x+2, y] if self.team == "top" && can_occupy?([x+2, y])
      moves << [x-2, y] if self.team == "bottom" && can_occupy?([x-2, y])
    end
    moves
  end
end
