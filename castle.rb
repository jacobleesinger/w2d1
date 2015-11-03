class Castle < SlidingPiece
  def initialize
    @token = "[C]"
  end

  def possible_moves
    x, y = @position
    moves = []
    #row # [nil, nil, p, nil, self, nil, P, nil]
    i = 0
    until row[i] == self
      moves << [i, y]
      if row[i].team == self.team
        moves = []
      elsif row[i].team != self.team

        # subarray of row
        # cannot include friendly pieces
        # must include self but cannot move to self
        # can include enemy pieces but only at first or last
        # can probably move to SlidingPiece
      end
    end
    

  end

  def row
    @board.grid[@position[0]]
  end

  def column
    transposed_grid = @board.grid.transpose
    transposed_grid[@position[1]]
  end
end
