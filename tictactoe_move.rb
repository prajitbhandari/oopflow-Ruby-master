# frozen_string_literal: true

# Description/Explanation of Move class
class Move
  attr_accessor :row, :col

  def initialize(row, col)
    @row = row
    @col = col
  end
end
