# frozen_string_literal: true

require_relative 'tictactoe_move.rb'
# Description/Explanation of Player class
class Player
  attr_accessor :identifier, :move_token

  def initialize(identifier, move_token)
    @identifier = identifier
    @move_token = move_token
  end

  def ask_next_move
    puts 'Enter the move_mark at available Array index [][]'
    puts
    @row = gets.chomp.to_i
    @col = gets.chomp.to_i
    @obj = Move.new(@row, @col)
  end
end
