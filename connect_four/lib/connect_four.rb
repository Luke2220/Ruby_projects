class Board

    def initialize()
        @slots = Array.new(2,Array.new())

        for i in 1..6 do
            @slots[0] << BoardPiece.new()
        end

        for j in 1..7 do
            @slots[1] << BoardPiece.new()     
        end
        
    end

    def drop_piece(x)
        counter = 0
        while @slots[x.to_i][counter].is_state_empty?
            counter += 1
            return nil if counter >= 7
        end
        @slots[x.to_i][counter].state = "blue"
    end

    def puts_board
        @slots.each do |row| 
         row.each {|column| print "#{column.state} "}
         puts ""
        end
       end

end

class BoardPiece
    attr_accessor :state
    def initialize
        state = 'empty'
    end
    def is_state_empty?()
        return true if state == 'empty'

        return false
    end
end

class PlayGame
    def initialize()
       @our_board = Board.new()
       @current_player = 1
       @symbol = 'blue'
    end

    def play_turn()
        puts "Choose from columns 1-7 to play into"
        input = gets.chomp

        @our_board.drop_piece(input)
        change_player()
    end

    def change_player()
        if @current_player == 1
            @current_player = 2
            @symbol = 'red'
        elsif @current_player == 2
            @current_player = 1
            @symbol = 'blue'
        end
    end

end
new_game = PlayGame.new
