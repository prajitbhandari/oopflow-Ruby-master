# frozen_string_literal: true

require_relative 'tictactoe_player.rb'
# Description/Explanation of Board class
class Board
  attr_accessor :cells, :size

  def initialize(size, player1, player2)
    @size = size
    @cells = []
    (0...size).each do |_i|
      @cells.push(['', ''])
    end
    @player1 = player1
    @player2 = player2
    @draw_counter = 0
  end

  def is_valid_move?(current_player)
    if is_move_out_of_boundary?(current_player) || is_duplicate_move?(current_player)
      false
    else
      true
    end
  end

  def is_move_out_of_boundary?(current_player)
    next_row = current_player.get_next_move.row
    next_col = current_player.get_next_move.col
    if next_row >= size || next_col >= size || next_row.negative? || next_col.negative?
      return true

    else
      return false
    end
  end

  def is_duplicate_move?(current_player)
    next_row = current_player.get_next_move.row
    next_col = current_player.get_next_move.col

    if cells[next_row][next_col] == 'X' || cells[next_row][next_col] == 'O'
      return true

    elsif cells[next_row][next_col] != 'X' || cells[next_row][next_col] != 'O'
      return false
    end
  end

  def register_move(move, current_player)
    cells[move.row][move.col] = current_player.move_token
  end

  def print_board
    puts
    (0...size).each do |x|
      (0...size).each do |y|
        print cells[x][y]
        print '  |   ' if y != size - 1
      end
      if x != size - 1
        print "\n"
        (0...(size + (size * 3))).each do |_i|
          print '='
        end
      end
      print "\n"
    end
  end

  def left_diagonal_win?
    player1_count = 1
    player2_count = 1
    (0...size - 1).each do |i|
      (0...size - 1).each do |j|
        if i == j
          if cells[i][j] == 'X' && cells[i + 1][j + 1] == 'X'
            player1_count += 1
            return @result = @player1.identifier if player1_count == size

          elsif cells[i][j] == 'O' && cells[i + 1][j + 1] == 'O'
            player2_count += 1
            return @result = @player2.identifier if player2_count == size

          else
            return false

          end
        end
      end
    end
  end

  def right_diagonal_win?
    player1_count = 1
    player2_count = 1
    (0...size).each do |i|
      (0...size).each do |j|
        if i + j == size - 1
          if cells[i][j] == 'X' && cells[i + 1][j - 1] == 'X'
            player1_count += 1
            return @result = @player1.identifier if player1_count == size

          elsif cells[i][j] == 'O' && cells[i + 1][j - 1] == 'O'
            player2_count += 1
            return @result = @player2.identifier if player2_count == size

          else
            return false
          end
        end
      end
    end
  end

  def row_win?
    player1_count = 1
    player2_count = 1
    (0...size).each do |i|
      (0...size - 1).each do |j|
        if cells[i][j] == 'X' && cells[i][j + 1] == 'X'
          player1_count += 1
          return @result = @player1.identifier if player1_count == size

        elsif cells[i][j] == 'O' && cells[i][j + 1] == 'O'
          player2_count += 1
          return @result = @player2.identifier if player2_count == size

        elsif i == size - 1 && j == size - 2
          return false
        end
      end
      player1_count = 1
      player2_count = 1
    end
    false
  end

  def column_win?
    player1_count = 1
    player2_count = 1
    (0...size).each do |i|
      (0...size - 1).each do |j|
        if cells[j][i] == 'X' && cells[j + 1][i] == 'X'
          player1_count += 1
          return @result = @player1.identifier if player1_count == size

        elsif cells[j][i] == 'O' && cells[j + 1][i] == 'O'
          player2_count += 1
          return @result = @player2.identifier if player2_count == size

        elsif i == size - 1 && j == size - 2
          return false
        end
      end
      player1_count = 1
      player2_count = 1
    end
    false
  end

  def game_is_won?
    left_diagonal_win? ||
      right_diagonal_win? ||
      row_win? ||
      column_win?
  end

  def game_is_draw?
    @draw_counter += 1
    if @draw_counter == (size * size) + 1
      return true
    else
      return false
    end
  end

  def winning_player
    @result
  end
end # class ends
