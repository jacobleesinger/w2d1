class Castle < SlidingPiece

  def to_s
    "[C]"
  end

  def possible_moves
    self.straight_moves
  end

end
