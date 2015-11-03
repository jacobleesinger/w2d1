class King < SteppingPiece
  def initialize
    @token = "[K]"
  end

  

  def valid_moves
    # king cannot move into danger! implement later
    moves = []
    board.grid.each_with_index do |row, x|
      row.each_with_index do |tile, y|
        if (@position[0] - x).abs == 1 && (@position[1] - y).abs == 1
          if tile.nil? || tile.team != self.team
            moves << [x, y]
          end
        end
      end
    end
    moves
  end


end
