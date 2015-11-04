class Piece
  attr_accessor :position, :team, :board, :has_moved
  def initialize(position, board)
    @position = position
    @board = board
    @has_moved = false
  end

  def to_s
    token
  end

  def move(end_pos)
    x, y = end_pos
    if possible_moves.include?(end_pos)
      @board.grid[x][y] = self
      @board.grid[@position[0]][@position[1]] = nil
      @position = end_pos
      @has_moved = true
    end
  end

  def can_occupy?(pos)
    x, y = pos
    return false unless on_board?([x, y])
    true if @board.grid[x][y].nil?
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
      while can_occupy?([x, y])
        moves << [x, y] if can_occupy?([x, y])
        x, y = x + row, y + col
      end
      #Make taking enemy pieces available.
      if on_board?([x, y]) && @board.grid[x][y]
        moves << [x, y] if @board.grid[x][y].team != self.team
      end

    end
    moves
  end

  def diagonal_moves
    moves = []
    diagonal.each do |row, col|
      x, y = @position.dup
      x, y = x + row, y + col
      while can_occupy?([x, y])
        move = [x, y]
        moves << move if can_occupy?(move)
        x, y = x + row, y + col
      end
      if on_board?([x, y]) && @board.grid[x][y]
        moves << [x, y] if @board.grid[x][y].team != self.team
      end

    end
    moves
  end



end
