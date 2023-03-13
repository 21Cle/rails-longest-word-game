require "open-uri"

class GamesController < ApplicationController

  def new
    @letters = ('A'..'Z').to_a.sample(10)
    @letters.shuffle!
  end

  def score
    @letters = params[:letters].split #transformer en array
    @word = params[:word]
    @included = included?(@word, @letters)
    @english_word = english_word?(@word)
  end

  private

  def included?(word, letters)
    word.chars.all? { |letter| word.count(letter) <= letters.count(letter) }
  end

  def english_word?(word)
    response = URI.open("https://wagon-dictionary.herokuapp.com/#{word}")
    json = JSON.parse(response.read)
    json['found']
  end
end
