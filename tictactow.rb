require "pry"
X = "X"
O = "O"
victory = false
class TicTacToeBoard

  def initialize(size=3)
    @board = Array.new()
        
    for i in 1..3 do  
      new_row = []  
      for j in 1..3 do      
        new_row << BoardSlot.new     
      end
      @board << new_row    
    end   
  end


  def set_slot(x, y, type)
    @board[y.to_i - 1][x.to_i - 1].state = type 
   
  end

  def puts_board
   @board.each do |row| 
    row.each {|column| print "#{column.state} "}
    puts ""
   end
  end

  def check_victory(symbol)

    @board.each_index do |index|
      accu = 0
      @board.each do |value|

        if (value[index].state == symbol)
          accu +=1
        else
          accu += 0
        end
        if (accu == 3)
          return true
        end
      end

    end

    @board.each do |value|
      accu = 0
      value.each do | value|

        if (value.state == symbol)
          accu +=1
        else
          accu += 0
        end
       
        if (accu == 3)
          return true
        end
    end
    
    counter = 0  
    accu = 0  
      @board.each do |value|
     
        if (value[counter].state == symbol)
          accu += 1
        else
          
        end
          
        counter += 1

        if (accu == 3)
          return true
        end   
    end

    counter = @board.length
    accu = 0  
    @board.each do |value| 
      if (value[counter - 1].state == symbol)
        accu += 1
      else
        
      end
        
      counter -= 1

      if (accu == 3)
        return true
      end   
  end

  end
    return false
 end
end

class BoardSlot
  attr_accessor :state
  
 def initialize()
  @state = "E"
 end
end

class PlayGame
 
  attr_reader :currentboard

  def initialize()
    @players_turn = "1"
    @currentboard = TicTacToeBoard.new(3)
    @symbol = X
    @currentboard.puts_board
    puts "Player's 1 turn."
  end

  def change_turn

    victory = currentboard.check_victory(@symbol)

    if (victory)
      @currentboard.puts_board
      puts "Player #{@players_turn} wins!"
      return "Victory"
    end

    if (@players_turn == "1")
      puts "Player's 2 turn." 
      @currentboard.puts_board  
      @players_turn = "2"
      @symbol = O
    else
      puts "Player's 1 turn." 
      @currentboard.puts_board 
      @players_turn = "1"
      @symbol = X
    end
  end

  def get_input()
    puts "Enter X,Y coordinates"
    input = gets.chomp
    cor = input.split('').filter {|value| /[1-9]/.match?(value)} 
    @currentboard.set_slot(cor[0],cor[1], @symbol)
  end

end

new_game = PlayGame.new()
while victory == false 
  new_game.get_input()
  new_game.change_turn
end










