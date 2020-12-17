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
        return @slots[counter-1][x_pos.to_i]
    end

    def puts_board
        @slots.each do |row| 
         row.each {|column| print "#{column.state} "}
         puts ""
        end
       end
end

class BoardSlot
    attr_accessor :state, :neighbors
    def initialize
        @state = 'O'
        @neighbors = Hash.new
    end

    def is_state_empty?()
        return true if @state == 'O'

        return false
    end
end

class PlayGame
    attr_reader :our_board, :is_victory
    def initialize()
       @our_board = Board.new()
       @current_player = 1
       @player_color = 'X'
       @is_victory = false
    end

    def start_game
        playing = true
    while playing == true
        while @is_victory == false
            play_turn()
        end

        if @is_victory 
            puts 'play again? Y/N'
            inpt = gets.chomp
        end

        if inpt == 'y'
            @our_board = Board.new()
            @current_player = 1
            @player_color = 'X'
            @is_victory = false
        else
            playing = false
        end
    end
end


    def play_turn()
       
        puts "Choose from columns 1-7 to play into"
        input = gets.chomp

        @our_board.drop_piece(input,@player_color)
        change_player()
    end

    def change_player()
        check_victory(@player_color)
        if @is_victory == true
            puts "winner"
            return true 
        end

        if @current_player == 1
            @current_player = 2
            @player_color = 'X'
        elsif @current_player == 2
            @current_player = 1
            @player_color = 'Y'
        end
    end

    def check_victory(symbol)
      
        counter = -2

        while counter < @our_board.slots.length do 
          streak = 0
          counter += 1
          @our_board.slots.each do |value|
    
            if (value[counter].state == symbol)
              streak +=1
            else
                streak = 0
            end
            if (streak == 4)
              @is_victory = true
              return true
            end
          end
    
        end
 
        @our_board.slots.each do |value|
          streak = 0
          value.each do | value|
    
            if (value.state == symbol)
              streak +=1
            else
                streak = 0
            end
           
            if (streak == 4)
                @is_victory = true
                return true
            end
        end
      end
    
check_diagonal(symbol)
        return false
     end

     def check_diagonal(symbol)

      @our_board.slots.each_with_index do |y, y_index|

        y.each_with_index do |x, x_index|
          if x.state == symbol
            streak = 0
            x_pos = x_index
            y_pos = y_index
           
            while @our_board.slots[y_pos][x_pos].state == symbol
              if (x_pos < 6 && x_pos > 0)
                x_pos += 1
              else
                break
              end
              if (y_pos < 5 && y_pos > 0)
                y_pos += 1
              else
                break
              end

              streak += 1
              if streak >= 4
                @is_victory = true
                return true
              end
            end
            x_pos = x_index
            y_pos = y_index

            while @our_board.slots[y_pos][x_pos].state == symbol
                  if (x_pos < 6 && x_pos > 0)
                x_pos -= 1
              else
                break
              end
              if (y_pos < 5 && y_pos > 0)
                y_pos -= 1
              else
                break
              end

              streak += 1
              if streak >= 4
                @is_victory = true
                return true
              end
            end

            x_pos = x_index
            y_pos = y_index
            streak = 0

            while @our_board.slots[y_pos][x_pos].state == symbol
                 if (x_pos < 6 && x_pos > 0)
                x_pos += 1
              else
                break
              end
              if (y_pos < 5 && y_pos > 0)
                y_pos -= 1
              else
                break
              end

              streak += 1
              if streak >= 4
                @is_victory = true
                return true
              end
            end

            x_pos = x_index
            y_pos = y_index

            while @our_board.slots[y_pos][x_pos].state == symbol
               if (x_pos < 6 && x_pos > 0)
                x_pos -= 1
              else
                break
              end
              if (y_pos < 5 && y_pos > 0)
                y_pos += 1
              else
                break
              end

              streak += 1
              if streak >= 4
                @is_victory = true
                return true
              end
            end

          
          end
        end

      end

     end

    end



