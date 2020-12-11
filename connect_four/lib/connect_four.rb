class Board
    attr_reader :slots
    def initialize()
        @slots = Array.new()
        for i in 0..5 do 
            puts i 
            new_row = []  
            for j in 0..6 do      
              new_row << BoardSlot.new     
            end
            @slots << new_row    
          end   
        
    end

    def drop_piece(x, color)
        counter = 0
        x_pos = x.to_i - 1
        while @slots[counter][x_pos.to_i].is_state_empty? == true
            counter += 1
            break if counter >= 6
        end
        @slots[counter-1][x_pos.to_i].state = color
         puts_board()
        connect_slots()
        return @slots[counter-1][x_pos.to_i]
    end

    def puts_board
        @slots.each do |row| 
         row.each {|column| print "#{column.state} "}
         puts ""
        end
       end

       def connect_slots
        @slots.each_with_index do |row,x_index| 
         row.each_with_index {|column,y_index| column.assign_neighbors(x_index-1,y_index-1,@slots)}      
        end
       end

end

class BoardSlot
    attr_accessor :state, :neighbors
    def initialize
        @state = 'O'
        @neighbors = Hash.new
    end

    def assign_neighbors(x,y,board_array)
  
        @neighbors[:right] = board_array[x+1][y] if (board_array[x+1][y] != nil)
           
        @neighbors[:upperright] = board_array[x+1][y+1] if (board_array[x+1][y+1] != nil)
      
        @neighbors[:up] = board_array[x][y-1] if (board_array[x][y+1] != nil)
       
        @neighbors[:upperleft] = board_array[x-1][y+1] if (board_array[x-1][y+1] != nil)
        
        @neighbors[:left] = board_array[x-1][y] if (board_array[x-1][y] != nil)
            
        @neighbors[:lowerleft] = board_array[x-1][y-1] if (board_array[x-1][y-1] != nil)
            
        @neighbors[:down] = board_array[x][y+1] if (board_array[x][y-1] != nil)
            
        @neighbors[:lowerright] = board_array[x+1][y-1] if (board_array[x+1][y-1] != nil)    
        
    end

    def is_state_empty?()
        return true if @state == 'O'

        return false
    end
end

class PlayGame
    attr_reader :our_board
    def initialize()
       @our_board = Board.new()
       @current_player = 1
       @player_color = 'blue'
       @is_victory = false
    end

    def play_turn()
        puts "Choose from columns 1-7 to play into"
        input = gets.chomp

        @our_board.drop_piece(input,@player_color)
        change_player()
    end

    def change_player()
        check_slots_victory()
        if @is_victory == true
            puts "winner"
            return true 
        end

        if @current_player == 1
            @current_player = 2
            @player_color = 'red'
        elsif @current_player == 2
            @current_player = 1
            @player_color = 'blue'
        end
    end

    def check_slots_victory()
        @our_board.slots.each do |row| 
            row.each do |slot|  
                check_victory_rec(slot)
            end
        end
    end


    def check_victory_rec(slot, counter=0,direction='')      
                if counter >= 4
                    @is_victory = true
                    return nil
                end
                puts slot
                puts slot.neighbors[:up]
                if slot != nil && slot.state != 'O'
                    if direction == 'up' || direction == '' && slot.neighbors[:up] != nil && slot.neighbors[:up].state == slot.state
                        puts slot.neighbors[:up]
                        check_victory_rec(slot.neighbors[:up],counter+1,'up')
                    end

                    if direction == 'upperright' || direction == '' && slot.neighbors[:upperright] != nil && slot.neighbors[:upperright].state == slot.state
                        puts slot.neighbors[:upperright]
                        check_victory_rec(slot.neighbors[:upperright],counter+1,'upperright')
                    end

                    if direction == 'upperleft' || direction == '' && slot.neighbors[:upperleft] != nil && slot.neighbors[:upperleft].state == slot.state
                        puts slot.neighbors[:upperleft]
                        check_victory_rec(slot.neighbors[:upperleft],counter+1,'upperleft')
                    end

                    if direction == 'left' || direction == '' && slot.neighbors[:left] != nil && slot.neighbors[:left].state == slot.state
                        puts slot.neighbors[:left]
                        check_victory_rec(slot.neighbors[:left],counter+1, 'left')
                    end

                    if direction == 'down' || direction == '' && slot.neighbors[:down] != nil && slot.neighbors[:down].state == slot.state
                        puts slot.neighbors[:down]
                        check_victory_rec(slot.neighbors[:down],counter+1, 'down')
                    end

                    if direction == 'lowerleft' || direction == '' && slot.neighbors[:lowerleft] != nil && slot.neighbors[:lowerleft].state == slot.state
                        puts slot.neighbors[:lowerleft]
                        check_victory_rec(slot.neighbors[:lowerleft],counter+1, 'lowerleft')
                    end

                    if direction == 'lowerright' || direction == '' && slot.neighbors[:lowerright] != nil && slot.neighbors[:lowerright].state == slot.state
                        puts slot.neighbors[:lowerright]
                        check_victory_rec(slot.neighbors[:lowerright],counter+1, 'lowerright')
                    end

                    if direction == 'right' || direction == '' && slot.neighbors[:right] != nil && slot.neighbors[:right].state == slot.state
                        puts slot.neighbors[:right]
                        check_victory_rec(slot.neighbors[:right],counter+1, 'right')
                    end
end
        return nil
    end

    def check_victory()
        @our_board.slots.each do |row| 
            row.each do |slot| 
                if slot != nil && slot.state != 'O'
                    temp = slot
                    counter = 0

                    puts slot
                    
                    while temp.neighbors[:up] != nil && temp.neighbors[:up].state == temp.state 
                        puts "#{temp.neighbors[:up]}, state: #{temp.neighbors[:up]}"
                        puts temp.neighbors[:up]
                                               puts temp
                       
                        temp = temp.neighbors[:up]
                                               puts temp
 
                        counter += 1
                        return true if counter >= 4
                    end
                    counter = 0
                    temp = slot

                    while temp.neighbors[:upperright] != nil && temp.neighbors[:upperright].state == temp.state 
                        puts "#{temp.neighbors[:upperright]}, state: #{temp.neighbors[:upperright]}"
                        

                                               puts temp
                        temp = temp.neighbors[:upperright]
                                                   puts temp       
                                                    counter += 1
                        return true if counter >= 4
                    end
                    counter = 0
                    temp = slot

                    while temp.neighbors[:upperleft] != nil && temp.neighbors[:upperleft].state == temp.state 
                        puts "#{temp.neighbors[:upperleft]}, state: #{temp.neighbors[:upperleft]}"
                        
                                               puts temp                        
                                               temp = temp.neighbors[:upperleft]                                       
                                                   puts temp             
                                                              counter += 1
                        return true if counter >= 4
                    end
                    counter = 0
                    temp = slot

                    while temp.neighbors[:left] != nil && temp.neighbors[:left].state == temp.state 
                        puts "#{temp.neighbors[:left]}, state: #{temp.neighbors[:left]}"
                        
                                               puts temp                        
                                               temp = temp.neighbors[:left]
                                                   puts temp                       
                                                    counter += 1
                        return true if counter >= 4
                    end
                    counter = 0
                    temp = slot

                    while temp.neighbors[:lowerleft] != nil && temp.neighbors[:lowerleft].state == temp.state 
                        puts "#{temp.neighbors[:lowerleft]}, state: #{temp.neighbors[:lowerleft]}"
                        
                                               puts temp                       
                                                temp = temp.neighbors[:lowerleft]
                                                   puts temp                       
                                                    counter += 1
                        return true if counter >= 4
                    end
                    counter = 0
                    temp = slot

                    while temp.neighbors[:down] != nil && temp.neighbors[:down].state == temp.state 
                        puts "#{temp.neighbors[:down]}, state: #{temp.neighbors[:down]}"
                        
                                               puts temp                      
                                                 temp = temp.neighbors[:down]
                                                   puts temp                       
                                                    counter += 1
                        return true if counter >= 4
                    end
                    counter = 0
                    temp = slot

                    while temp.neighbors[:lowerright] != nil && temp.neighbors[:lowerright].state == temp.state 
                        puts "#{temp.neighbors[:lowerright]}, state: #{temp.neighbors[:lowerright]}"
                        
                                               puts temp                        
                                               temp = temp.neighbors[:lowerright]
                                                   puts temp                      
                                                     counter += 1
                        return true if counter >= 4
                    end
                    counter = 0
                    temp = slot

                    while temp.neighbors[:right] != nil && temp.neighbors[:right].state == temp.state 
                        puts "#{temp.neighbors[:right]}, state: #{temp.neighbors[:right]}"
                        
                                               puts temp                        
                                               temp = temp.neighbors[:right]
                                                   puts temp                       
                                                    counter += 1
                        return true if counter >= 4
                    end
                    counter = 0
                    temp = slot

          
                end
            end
           end
           return false
    end
end

