require_relative 'piece.rb'
require_relative 'sliding_piece.rb'
require_relative 'stepping_piece.rb'
require_relative 'castle.rb'
require_relative 'king.rb'
require_relative 'knight.rb'
require_relative 'pawn.rb'
require_relative 'queen.rb'
require_relative 'bishop.rb'

class Board
  attr_reader :grid
  def initialize
    @grid = Array.new(8) { Array.new(8) }
    place_pieces
  end

  def place_pieces
    @grid.each_with_index do |row, ridx|
      row.each_with_index do |spot, cidx|
        if ridx == 0 || ridx == 7
          if cidx == 0 || cidx == 7
            @grid[ridx][cidx] = Castle.new([ridx, cidx], self)
          end
          if cidx == 1 || cidx == 6
            @grid[ridx][cidx] = Knight.new([ridx, cidx], self)
          end
          if cidx == 2 || cidx == 5
            @grid[ridx][cidx] = Bishop.new([ridx, cidx], self)
          end
          if ridx == 0 && cidx == 3
            @grid[ridx][cidx] = Queen.new([ridx, cidx], self)
          end
          if ridx == 0 && cidx == 4
            @grid[ridx][cidx] = King.new([ridx, cidx], self)
          end
          if ridx == 7 && cidx == 3
            @grid[ridx][cidx] = King.new([ridx, cidx], self)
          end
          if ridx == 7 && cidx == 4
            @grid[ridx][cidx] = Queen.new([ridx, cidx], self)
          end
        end

        if ridx == 1 || ridx == 6
          @grid[ridx].map! { Pawn.new([ridx, cidx], self) }
        end

      end

    end
  end



  def [](pos)
    row, col = pos
    @grid[row][col]
  end

  def []=(pos, value)
    row, col = pos
    @grid[row][col] = value
  end

  def move(start_pos, end_pos)
    x, y = start_pos
    x2, y2 = end_pos
    fail "no piece at #{start_pos}" unless @grid[x][y]
    # fail "the piece at #{start_pos} cannot move to #{end_pos}"
    # unless the move is valid for that piece
  end
end
