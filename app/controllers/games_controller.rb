class GamesController < ApplicationController
  def new
    @letters = ("A".."Z").to_a.sample(10).join(" ")
  end

  def is_word_valid?
    word.chars.all? { |letter| board.include?(letter) && (board.count(letter) >= word.count(letter)) }
  end

  def is_english_word_valid?
    url = "https://wagon-dictionary.herokuapp.com/#{word}"
    @json = JSON.parse(URI.open(url).read)
    return json["found"]
  end


  def score
    @score = 0
    @word = params[:word]
    @board = params[:board].split
    @lettervalue = params[:lettervalue]
    raise
    if
      puts "Sorry but #{@word} can't be built out of #{@lettervalue}"
    elsif

      puts "Sorry but #{@word} does not seem to be a valid English word..."
    else
      puts "Congratulations! #{@word} is a valid English word!"
    end
  end
end
