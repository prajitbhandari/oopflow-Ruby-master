# frozen_string_literal: true

require_relative 'tictactoe_player.rb'
# Description/Explanation of Board class
class Board
  attr_accessor :board, :board_size

  def initialize(board_size, player1, player2)
    @board_size = board_size
    @board = []
    (0...@board_size).each do |_i|
      @board.push(['', ''])
    end
    @p1 = player1
    @p2 = player2
  end

  def show
    puts "The Player is #{@p1.identifier} and move token is #{@p1.move_token}"
    puts "The Opponent is #{@p2.identifier} and move token is #{@p2.move_token}"
    puts
    (0...board_size).each do |x|
      (0...board_size).each do |y|
        print x, y
        print '  |   ' if y != board_size - 1
      end

      if x != board_size - 1
        print "\n"
        (0...board_size + (board_size * 6)).each do |_i|
          print '='
        end
      end
      print "\n"
    end
  end

  def print_board
    puts
    (0...board_size).each do |x|
      (0...board_size).each do |y|
        print board[x][y]
        print '  |   ' if y != board_size - 1
      end

      if x != board_size - 1
        print "\n"
        (0...board_size + (board_size * 6)).each do |_i|
          print '='
        end
      end
      print "\n"
    end
  end
end
