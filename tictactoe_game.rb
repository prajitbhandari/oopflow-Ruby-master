# frozen_string_literal: true

require_relative 'tictactoe_board.rb'
require 'byebug'
# Description/Explanation of Game class
class Game
  def initialize
    @p1 = Player.new('Player 1', 'X')
    @p2 = Player.new('Player 2', 'O')
    @board_size = ask_board_size
    @b = Board.new(@board_size, @p1, @p2)
    @b.show
    @move_counter = 1
    @draw_counter = 0
    proceed
  end

  def ask_board_size
    puts 'Welcome to Tic Tac Toe Game!!!'
    #   prompt board size form user
    puts 'Enter the size of the Board Grid'
    @size = gets.chomp.to_i
    if @size < 2
      puts 'Please Provide Size Greater than or equal to 2'
      puts
      ask_board_size
    end
    @size
  end

  def proceed
    until ended?
      puts
      puts '==================================================='
      handle_next_move
    end
    # debugger
    show_result
    # unless self.ended?
    #     self.handleNextMove
    # else
    #    self.showResult
    # end
  end

  def ended?
    game_is_won? || game_is_draw?
  end

  def game_is_won?
    left_diagonal(@b.board, @b.board_size) ||
      right_diagonal(@b.board, @b.board_size) ||
      check_row(@b.board, @b.board_size) ||
      check_column(@b.board, @b.board_size)
  end

  def game_is_draw?
    @draw_counter += 1
    return false unless @draw_counter == (@b.board_size * @b.board_size) + 1

    left_diagonal(@b.board, @b.board_size) == false &&
      right_diagonal(@b.board, @b.board_size) == false &&
      check_row(@b.board, @b.board_size) == false &&
      check_column(@b.board, @b.board_size) == false
    # end
  end

  def handle_next_move
    if @move_counter.odd?
      puts
      puts "Now #{@p1.identifier} turn"
      puts "Place #{@p1.move_token} in board"
      puts
      @objx = @p1.ask_next_move
      if @objx.row >= @b.board_size || @objx.col >= @b.board_size
        puts
        puts '==================================================='
        puts "#{@p1.identifier} choose valid row and column"
        handle_next_move
      elsif @b.board[@objx.row][@objx.col] == 'X' || @b.board[@objx.row][@objx.col] == 'O'
        puts '==================================================='
        puts "#{@p1.identifier} select another cell"
        handle_next_move
      elsif @b.board[@objx.row][@objx.col] != 'X' || @b.board[@objx.row][@objx.col] != 'O'
        @b.board[@objx.row][@objx.col] = @p1.move_token
        @b.print_board
        @move_counter += 1
      end
    else
      puts "Now #{@p2.identifier} turn"
      puts "Place #{@p2.move_token} in board"
      puts
      @objx = @p2.ask_next_move
      if @objx.row >= @b.board_size || @objx.col >= @b.board_size
        puts
        puts '==================================================='
        puts "#{@p2.identifier} choose valid row and column"
        handle_next_move
      elsif @b.board[@objx.row][@objx.col] == 'X' || @b.board[@objx.row][@objx.col] == 'O'
        puts '==================================================='
        puts "#{@p2.identifier} select another cell"
        handle_next_move
      elsif @b.board[@objx.row][@objx.col] != 'X' || @b.board[@objx.row][@objx.col] != 'O'
        @b.board[@objx.row][@objx.col] = @p2.move_token
        @b.print_board
        @move_counter += 1
      end
    end
  end

  def left_diagonal(board, board_size)
    xlcount = 1
    olcount = 1
    (0...board_size - 1).each do |i|
      (0...board_size - 1).each do |j|
        if i == j
          if board[i][j] == 'X' && board[i + 1][j + 1] == 'X'
            xlcount += 1
            return @result = @p1.identifier if xlcount == board_size

          elsif board[i][j] == 'O' && board[i + 1][j + 1] == 'O'
            olcount += 1
            return @result = @p2.identifier if olcount == board_size

          else
            return false

          end
        end
      end
    end
  end

  def right_diagonal(board, board_size)
    xrcount = 1
    orcount = 1
    (0...board_size - 1).each do |i|
      (0..board_size - 1).each do |j|
        if i + j == board_size - 1
          if board[i][j] == 'X' && board[i + 1][j - 1] == 'X'
            xrcount += 1
            return @result = @p1.identifier if xrcount == board_size

          elsif board[i][j] == 'O' && board[i + 1][j - 1] == 'O'
            orcount += 1
            return @result = @p2.identifier if orcount == board_size

          else
            return false
          end
        end
      end
    end
  end

  def check_row(board, board_size)
    xcount = 1
    ycount = 1
    (0..(board_size - 1)).each do |i|
      (0..(board_size - 2)).each do |j|
        if board[i][j] == 'X' && board[i][j + 1] == 'X'
          xcount += 1
          return @result = @p1.identifier if xcount == board_size
            
        elsif board[i][j] == 'O' && board[i][j + 1] == 'O'
          ycount += 1
          return @result = @p2.identifier if ycount == board_size
            
        elsif i == board_size - 1 && j == board_size - 2
            return false
        end
      end
      xcount = 1
      ycount = 1
    end
    false
  end

  def check_column(board, board_size)
    xcount = 1
    ycount = 1
    (0...board_size).each do |i|
      (0...(board_size - 1)).each do |j|
        if board[j][i] == 'X' && board[j + 1][i] == 'X'
          xcount += 1
          return @result = @p1.identifier if xcount == board_size
            
        elsif board[j][i] == 'O' && board[j + 1][i] == 'O'
          ycount += 1
          return @result = @p2.identifier if ycount == board_size
            
          return false elsif i == board_size - 1 && j == board_size - 2
        end
      end
      xcount = 1
      ycount = 1
    end
    false
  end

  def show_result
    if game_is_won?
      # debugger
      puts
      puts "Yay #{@result} wins!!!"

    elsif !game_is_draw?
      puts
      puts 'Game is Tied'
    end
  end
end

@game = Game.new
