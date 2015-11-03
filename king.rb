class King < SteppingPiece
  attr_reader :token
    def to_s
      "[K]"
    end



  def possible_moves
    # king cannot move into danger! implement later using #check?
    moves = []
    moves += straight_moves
    moves += diagonal_moves
    moves.select do |x, y|
      (@position[0] - x).abs == 1 || (@position[1] - y).abs == 1
    end
  end

end
