class Board
    attr_reader :slots
    def initialize()
        @slots = Array.new(7,Array.new())

        for i in 1..6 do
            @slots[0] << BoardSlot.new()
        end
    end

    def drop_piece(x, color)
        counter = 0
        while @slots[x.to_i][counter].is_state_empty?
            counter += 1
            return nil if counter >= 7
        end
        @slots[x.to_i][counter].state = color
        connect_slots()
    end

    def puts_board
        @slots.each do |row| 
         row.each {|column| print "#{column.state} "}
         puts ""
        end
       end

       def connect_slots
        @slots.each do |row| 
         row.each {|column| column.assign_neighbors(row,column,@slots)}      
        end
       end

end

class BoardSlot
    attr_accessor :state, :neighbors
    def initialize
        @state = 'empty'
        @neighbors = Hash.new
    end

    def assign_neighbors(x,y,board_array)
        @neighbors[:right] = board_array[x+1][y] if (board_array[x+1][y].state != 'empty')
            
        @neighbors[:upperright] = board_array[x+1][y+1] if (board_array[x+1][y+1].state != 'empty')
            
        @neighbors[:up] = board_array[x][y+1] if (board_array[x][y+1].state != 'empty')
            
        @neighbors[:upperleft] = board_array[x-1][y+1] if (board_array[x-1][y+1].state != 'empty')
           
        @neighbors[:left] = board_array[x-1][y] if (board_array[x-1][y].state != 'empty')
            
        @neighbors[:lowerleft] = board_array[x-1][y-1] if (board_array[x-1][y-1].state != 'empty')
            
        @neighbors[:down] = board_array[x][y-1] if (board_array[x][y-1].state != 'empty')
            
        @neighbors[:lowerright] = board_array[x+1][y-1] if (board_array[x+1][y-1].state != 'empty')          
    end

    def is_state_empty?()
        return true if @state == 'empty'

        return false
    end
end

class PlayGame
    def initialize()
       @our_board = Board.new()
       @current_player = 1
       @player_color = 'blue'
    end

    def play_turn()
        puts "Choose from columns 1-7 to play into"
        input = gets.chomp

        @our_board.drop_piece(input,@player_color)
        change_player()
    end

    def change_player()
        if @current_player == 1
            @current_player = 2
            @player_color = 'red'
        elsif @current_player == 2
            @current_player = 1
            @player_color = 'blue'
        end
    end

    def check_victory()
        @our_board.@slots.each do |row| 
            row.each do |slot| 
                if slot.state != 'empty'
                    temp = slot
                    counter = 0
                    while temp.neighbors[:up].state != 'empty'
                        temp = temp.neighbors[:up]
                        counter += 1
                        return true if counter >= 4
                    end
                    while temp.neighbors[:upperright].state != 'empty'
                        temp = temp.neighbors[:upperright]
                        counter += 1
                        return true if counter >= 4
                    end
                    while temp.neighbors[:upperleft].state != 'empty'
                        temp = temp.neighbors[:upperleft]
                        counter += 1
                        return true if counter >= 4
                    end
                    while temp.neighbors[:left].state != 'empty'
                        temp = temp.neighbors[:left]
                        counter += 1
                        return true if counter >= 4
                    end
                    while temp.neighbors[:lowerleft].state != 'empty'
                        temp = temp.neighbors[:lowerleft]
                        counter += 1
                        return true if counter >= 4
                    end
                    while temp.neighbors[:down].state != 'empty'
                        temp = temp.neighbors[:down]
                        counter += 1
                        return true if counter >= 4
                    end
                    while temp.neighbors[:lowerright].state != 'empty'
                        temp = temp.neighbors[:lowerright]
                        counter += 1
                        return true if counter >= 4
                    end
                    while temp.neighbors[:right].state != 'empty'
                        temp = temp.neighbors[:right]
                        counter += 1
                        return true if counter >= 4
                    end
                end
            end
           end
           return false
    end
end
new_game = PlayGame.new
