require_relative 'config/environment'
require_relative 'models/text_analyzer.rb'

class App < Sinatra::Base
  get '/' do
    erb :index
  end

  post '/' do
    text_from_user = params[:user_text]
    @num_of_words = text_from_user.split(" ").count

    alphabet = {"a" => 0, "b" => 0, "c" => 0, "d" => 0, "e" => 0, "f" => 0,
      "g" => 0, "h" => 0, "i" => 0, "j" => 0, "k" => 0, "l" => 0, "m" => 0,
      "n" => 0, "o" => 0, "p" => 0, "q" => 0, "r" => 0, "s" => 0, "t" => 0,
      "u" => 0, "v" => 0, "w" => 0, "x" => 0, "y" => 0, "z" => 0}

    text_from_user.split("").each do |letter|
      if alphabet.keys.include?(letter.downcase)
        alphabet[letter.downcase] += 1
      end
    end

    vowels = alphabet.select { |letter, total| letter == "a" || letter == "e" ||
       letter == "i" || letter == "o" || letter == "u" }.values
    @num_of_vowels = vowels.reduce {|x, y| x+y }

    num_of_letters = alphabet.values.reduce {|x, y| x+y }
    @num_of_consonants = num_of_letters - @num_of_vowels

    @max_times = alphabet.values.max
    @max_letter = alphabet.select { |letter, total| total == @max_times }.last.first.upcase
    # above was coded specifically for green eggs and ham as an input
    # it does not distinguish between letters tied in count
    # also, there is no consideration for capital/lowercase letters
    erb :results
  end
end
