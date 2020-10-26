require 'yaml'

playing_game = true
save_file = nil


class HangmanGame

    attr_accessor :end_game

    def initialize (game_object = nil)
        @words = File.readlines "words.txt"
        @guessed_letters = "" 
        @word_to_guess = self.get_new_word(@words) 
        @num_of_guesses = 6
        @end_game = false
      
    end

    def get_new_word(words_string)     
        random_num = rand(1..60000)
        random_word = ""
        words_string.each_with_index do |line,index|
            if (index == random_num)
                random_word = line
                break
            end
        end
        random_word.downcase
    end

    def display_word 
        built_word = ""     
        @word_to_guess.split("").each do |val|
           if @guessed_letters.include?(val)
                built_word += val
           else
            built_word += " _ "
           end
        end

        puts built_word
    end

    def ask_player
        puts display_word
        puts "Make a guess!"
        puts "Guesses left #{@num_of_guesses}"
        puts""

        inpt = gets.chomp.downcase
          if @word_to_guess.include?(inpt[0])
            @guessed_letters += "#{inpt[0]} "
            puts "Correct!"        
        else 
            puts "Incorrect!" 
            @num_of_guesses -= 1
        end       
        self.check_victory_failure
    end

    def check_victory_failure
        puts ""
        if @num_of_guesses == 0         
            puts "You ran out of guesses!"
            puts "The word is: #{@word_to_guess}"
        @end_game = true
        elsif @word_to_guess == @guessed_letters
        puts "Congragulations! You won."
        @end_game = true
    end

    def ask_to_save
      if (@end_game == false)
        puts "Save game? (y/n)"
        inpt = gets.chomp.downcase

        if (inpt == 'y')
            to_yaml(self)
        end
      end
    end

end
end

def to_yaml(object_to_save)
    yaml_string = YAML.dump(object_to_save)
    save_file = File.open("save.txt", 'w')
     save_file.puts (yaml_string)
     save_file.close
   end
   
   def from_yaml()
       save_file = File.open("save.txt", 'r')
     YAML.load(save_file.read)
   end

while playing_game == true
    if (File.exists?('save.txt'))
        new_game = from_yaml
    else
        new_game = HangmanGame.new
    end

    while new_game.end_game == false
        new_game.ask_player
        new_game.ask_to_save
    end
    puts "Play Hangman? (y/n)"
    inpt = gets.chomp.downcase
    if (inpt == "n")
        playing_game = false
    end
end

