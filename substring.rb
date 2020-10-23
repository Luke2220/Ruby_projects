require 'pry'
dictionary = %w[Hello Go world how is hello today]

def substring(message, dict)
  message_lower = message.downcase
  dict.each_index do |index|
    dict[index].downcase!
  end

  selected_words = []

  selected_words = message_lower.split(/[^a-zA-Z]/).select { |word| !dict.index(word).nil?}
  puts selected_words
  counted_words = {}

  selected_words.each_index do |index|
    if counted_words.has_key?(selected_words[index])
      counted_words[selected_words[index]] += 1
    else
      counted_words[selected_words[index]] = 1
    end
  end

  puts counted_words
  counted_words
end

substring('Hello, World! How is today world? today', dictionary)
