require_relative 'config/environment'
require_relative 'models/text_analyzer.rb'
require 'pry'
class App < Sinatra::Base
  get '/' do
    erb :index
  end

  post '/' do
    @analyzed_text = TextAnalyzer.new(params[:user_text])
    erb :results
  end


  # class TextAnalyzer
  #   def initialize(text)
  #     @text = text
  #   end
  #
  #   def number_of_words
  #     @text.split(" ").count
  #   end
  #
  # end
end
