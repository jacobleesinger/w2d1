class Queen < SlidingPiece
  def to_s
    "[Q]"
  end

  def possible_moves
    moves = []
    moves += self.straight_moves
    moves += self.diagonal_moves
  end
end
