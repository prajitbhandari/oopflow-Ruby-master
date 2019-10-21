# frozen_string_literal: true

require_relative 'tictactoe_board.rb'
require 'byebug'
# Description/Explanation of Game class
class Game
  def initialize
    @player1 = Player.new('Player 1', 'X')
    @player2 = Player.new('Player 2', 'O')
    @current_player = @player1
    @cell_size = ask_board_size
    @board = Board.new(@cell_size, @player1, @player2)
  end

  def ask_board_size
    puts 'Welcome to Tic Tac Toe Game!!!'
    #   prompt board size form user
    puts 'Enter the size of the Board Grid'
    size = gets.chomp.to_i
    if size < 2
      puts 'Please Provide Size Greater than or equal to 2'
      puts
      ask_board_size
    end
    size
  end

  def display_player_info
    puts "The Player is #{@player1.identifier} and move token is #{@player1.move_token}"
    puts "The Opponent is #{@player2.identifier} and move token is #{@player2.move_token}"
  end

  def proceed
    display_player_info
    until ended?
      puts
      puts '==================================================='
      handle_next_move
    end
    show_result
    # unless self.ended?
    #     self.handleNextMove
    # else
    #    self.showResult
    # end
  end

  def ended?
    @board.game_is_won? || @board.game_is_draw?
  end

  def player_turn_info
    puts "Now #{@current_player.identifier} turn"
    puts "Place #{@current_player.move_token} in board"
  end

  def check_player_move
    player_turn_info
    current_move = @current_player.ask_next_move
    if @board.is_valid_move?(@current_player)
      @board.register_move(current_move, @current_player)
      @board.print_board
    else
      puts "#{@current_player.identifier} choose valid row and column"
      puts '==================================================='
      handle_next_move
    end
  end

  def handle_next_move
    if @current_player == @player1
      check_player_move
      @current_player = @player2
    else
      check_player_move
      @current_player = @player1
    end
  end

  def show_result
    if @board.game_is_won?
      # debugger
      puts
      puts "Yay #{@board.winning_player} wins!!!"
    elsif !@board.game_is_draw?
      puts
      puts 'Game is Tied'
    end
  end
end
@game = Game.new
@game.proceed
