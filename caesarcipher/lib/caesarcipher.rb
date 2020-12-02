require 'pry'
ALPHABET = 'abcdefghijklmnopqrstuvwxyz'.freeze

def caesar_cipher(word, shift)
  shiftedstring = word.split('').map do |char|
    if !char.match(/[a-zA-Z]/).nil?

      index_pos = ALPHABET.index(char.downcase)

      shift -= 26 while shift + index_pos > 26

      shift += 26 while shift + index_pos < 0

      char = ALPHABET[shift + index_pos]

    else
      char = char
    end
  end

  puts shiftedstring.join('')
  shiftedstring.join('')
end


