class Piece
  attr_accessor :position, :team, :board
  def initialize(position, board)
    @position = position
    @board = board
  end

  def to_s
    token
  end

  def move(end_pos)
    if valid_move(end_pos)
      @position = end_pos
    end
  end

  def can_occupy?(x, y)
    return false unless on_board?([x, y])
    @board.grid[x][y].nil?
  end

  def valid_move?(pos)
    x, y = pos

    return false unless on_board?(pos)
    return true if @board.grid[x][y].nil?
    return false if @board.grid[x][y].team == self.team
  end

  def on_board?(pos)
    x, y = pos
    return false unless x.between?(0, 7) && y.between?(0, 7)
    true
  end

  def straight
    [[-1, 0], [0, -1], [0, 1], [1, 0]]
  end

  def diagonal
    [[-1, -1], [-1, 1], [1, -1], [1, 1]]
  end

  def straight_moves
    moves = []
    straight.each do |row, col|
      x, y = @position.dup
      x, y = x + row, y + col
      tile = @board.grid[x][y]
      while can_occupy?(x, y)
                                            #will need to be able to
                                            #move to enemy pieces somehow
        move = [x, y]
        moves << move if valid_move?(move)
        x, y = x + row, y + col
      end

    end
    moves
  end

  def diagonal_moves
    moves = []
    diagonal.each do |row, col|
      x, y = @position.dup
      x, y = x + row, y + col
      tile = @board.grid[x][y]
      while can_occupy?(x, y)
        move = [x, y]
        moves << move if valid_move?(move)
        x, y = x + row, y + col
      end
    end
    moves
  end



end
