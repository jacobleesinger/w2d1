
require_relative 'board.rb'
require_relative 'player.rb'
require_relative 'display.rb'

class Game

  def initialize(players)
    @board = Board.new
    @player1, @player2 = players
  end

  def play
    take_turn until game_over?
    return winner
  end

  def take_turn
    #render display
    #ask for a move
    #check if move is valid
    #perfom the move if valid
    #switch players
  end

  def game_over?

  end

end
