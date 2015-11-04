require_relative 'piece.rb'
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

  def set_teams
    @grid.each_with_index do |row, idx|
      if idx == 0 || idx == 1
        row.each { |piece| piece.team = :team1 }
      end

      if idx == 6 || idx == 7
        row.each { |piece| piece.team = :team2 }
      end
    end
  end

  def place_pieces
    @grid.each_with_index do |row, ridx|
      row.each_with_index do |spot, cidx|

        #If on top row/bottom row...
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

        #If on top pawn row/bottom pawn row...
        if ridx == 1 || ridx == 6
          @grid[ridx][cidx] = Pawn.new([ridx, cidx], self)
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


end
