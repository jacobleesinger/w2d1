class Pawn < Piece
  def to_s
    "[p]"
  end

  def basic_moves
    x, y = @position.dup
    moves = []
    moves << [x+1, y] if self.team == :team1 && can_occupy?([x+1, y])
    moves << [x-1, y] if self.team == :team2 && can_occupy?([x-1, y])
    moves
  end

  def possible_moves
    x, y = @position.dup
    moves = basic_moves

    #if diagonals are enemies...
    if self.team == :team1
      enemy1 = @board.grid[x+1][y+1]
      enemy2 = @board.grid[x+1][y-1]
      unless enemy1.nil?
        moves << [x+1, y+1] if enemy1.team != self.team
      end
      unless enemy2.nil?
        moves << [x+1, y-1] if enemy2.team != self.team
      end
    end

    if self.team == :team2
      enemy1 = @board.grid[x-1][y-1]
      enemy2 = @board.grid[x-1][y+1]
      unless enemy1.nil?
        moves << [x-1, y-1] if enemy1.team != self.team
      end
      unless enemy2.nil?
        moves << [x-1, y+1] if enemy2.team != self.team
      end
    end

    unless self.has_moved
      moves << [x+2, y] if self.team == :team1 && can_occupy?([x+2, y])
      moves << [x-2, y] if self.team == :team2 && can_occupy?([x-2, y])
    end
    moves
  end
end
