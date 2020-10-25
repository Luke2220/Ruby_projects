require "pry"
COLORS = {1 => 'blue', 2 => 'red', 3 => 'green', 4 => 'white', 5 => 'black', 6 => 'turquiose'}
victory = false

class ComputerCodeMaker

  def initialize
    @computers_code = Hash.new
    @computers_guess = Hash.new
    @matches = 0
    @color_matches = []
    @guessed_colors
  end

  def create_code
    @computers_code = {}
    for i in 1..4 do
      @computers_code[i] = COLORS[rand(1..COLORS.length)]
    end
  end

  def compare_pos_color(player_code,computers_code) 
    @matches = 0  
    pos_matches = [] 
    player_code.each do |key, value|
        if value == computers_code[key]
          pos_matches << key     
        end  
    end
    return pos_matches
  end

  def compare_color(player_code,computers_code)
    same_colors = []

    player_code.each do |key, p_choice|
      computers_code.each do |key, color|
         if (color == p_choice) 
            same_colors << color
            binding.pry
         end
       end
     end
     return same_colors
  end

  def check_player_victory
    if (@matches == 4)
      victory = true
      return true   
    else
      puts ''
      puts "Color matches: #{@color_matches.length}, position and color matches: #{@matches}."
      puts ''
      return false
    end
  end

  def compare_codes(player_code)
    matches = 0
    color_matches = []
    colors_left = @computers_code
    
    player_code.each do |key, value|
        if value == @computers_code[key]
            matches += 1
            colors_left.delete(key)
           
        end
       
    end
 
    player_code.values.each do |p_choice|
     colors_left.values.each do |color|
        if (color == p_choice) 
           color_matches << color
        end
      end
    end
      
    
    if (matches == 4)
      victory = true
      return true   
    else
      puts ''
      puts "Position and color matches: #{matches}, color-only matches: #{color_matches.length}."
      puts ''
      return false
    end
  end


      
  def make_guess(players_code)
    random_guesses = 4
    if @guessed_colors.length > 0
      random_guesses -= @guessed_colors.length

      while @computers_guess.length < 4
        @computers_guess[computers_guess.length + 1] = COLORS[rand(1..COLORS.length)]
      end
    else
      for i in 1..4 do
        @computers_guess[i] = COLORS[rand(1..COLORS.length)]
      end
  end

  @computers_guess = {}
 saved_pos = compare_pos_color(players_code, @computers_code)
 saved_pos.each {|value| @computers_guess[value] = COLORS[value]}
 while @computers_guess.length < 4
  @computers_guess[computers_guess.length + 1] = COLORS[rand(1..COLORS.length)]
end

   same_colors = compare_color(players_code, @computers_guess)
   same_colors.each {|value| @guessed_colors << value}
   puts "Matching colors: "
   puts ''
   same_colors.each {|value| puts "#{value.to_s}, "}

   puts "Press enter to continue"
   gets
 end


  end



class Player

attr_reader :player_code

  def initialize()
    @player_guess = {}
    @player_code = {}
  end

  def get_guess
    puts "1 = blue, 2 = red, 3 = green,"
    puts "4 = white, 5 = black, 6 = turquiose"
    puts "Enter four numbers to guess!"
    inpt = gets.chomp.split('').filter {|value| /[1-6]/.match?(value)}

    for i in 1..4 do
      @player_guess[i] = COLORS[inpt[i - 1].to_i]
    end
    return @player_guess
  end

  def make_code
    puts "1 = blue, 2 = red, 3 = green,"
    puts "4 = white, 5 = black, 6 = turquiose"
    puts "Enter six numbers to create your code!"
    inpt = gets.chomp.split('').filter {|value| /[1-6]/.match?(value)}
   
    for i in 1..4 do
      @player_code[i] = COLORS[inpt[i - 1].to_i]
    end
  end
end


computer = ComputerCodeMaker.new
player = Player.new

puts "Press 1 to be the code guesser or 2 to be the code maker"
inpt = gets.chomp
if (inpt.to_s == "1")
  computer.create_code
  while victory == false
    computer.compare_codes(player.get_guess)
  end
  puts "You figured out the code!"
else
  player.make_code
  while victory == false
    computer.make_guess(player.player_code)
  end
end

