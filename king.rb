class King < SteppingPiece
  def initialize
    @token = "[K]"
  end

  def move(end_pos)
    if valid_move(end_pos)
      @position = end_pos
  end

  def valid_move?(pos)

    return true if valid_moves.include?(pos)
    false
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
