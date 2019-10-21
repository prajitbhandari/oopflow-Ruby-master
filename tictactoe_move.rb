# frozen_string_literal: true

# require_relative 'tictactoe_board.rb'
# Description/Explanation of Move class
class Move
  attr_accessor :row, :col

  def initialize(row, col)
    @row = row
    @col = col
  end
end
