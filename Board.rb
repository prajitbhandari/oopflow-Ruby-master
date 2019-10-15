require_relative 'Player.rb'
class Board
    attr_accessor :board,:board_size  
    
    def initialize(board_size,p1,p2)
        @board_size = board_size
        @board = []

        for i in 0...(@board_size) do
          @board.push(["",""])
        end
        
        @p1=p1
        @p2=p2   
    end
    
    def show
        puts "The Player is #{@p1.identifier} and move token is #{@p1.move_token}"
        puts "The Opponent is #{@p2.identifier} and move token is #{@p2.move_token}"
        puts 
        for x in 0...(self.board_size) do
            for y in 0...(self.board_size) do
                print x,y
                if (y != self.board_size-1) 
                    print '  |   '
                end
            end
       
            if (x != self.board_size-1)
                print '\n'
                for i in 0...(self.board_size + (self.board_size * 6)) do
                    print '='
                end
                print "\n"
            else 
                print "\n"
            end
        end

    end 
    
    def printBoard
        puts   
        for x in 0...(self.board_size) do
            for y in 0...(self.board_size) do
                print self.board[x][y]
                if (y != self.board_size-1) 
                    print '  |   '
                end
            end
       
            if (x != self.board_size-1)
                print "\n"
                for i in 0...(self.board_size + (self.board_size * 3)) do
                    print '='
                end
                print "\n"
            else 
                print "\n"
            end
        end
    end
end

