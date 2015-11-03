class SlidingPiece < Piece

  def moves(pos, directions)
    valid_moves = []
    (0..7).each do |row|
      (0..7).each do |col|
        if directions.include?(horizontal)
          if row == pos[0] || col == pos[1]
            valid_moves << [row, col]
          end
        end
        if directions.include?(diagonal)
          if row + col == pos[0] + pos[1] || row - col == pos[0] - pos [1]
            valid_moves << [row, col]
          end
        end
      end
    end
    valid_moves
  end
end
