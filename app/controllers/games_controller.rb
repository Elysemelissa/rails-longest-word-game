require 'open-uri'

class GamesController < ApplicationController
  def new
    @letters = ("a".."z").to_a.sample(9)
  end

  def score
    @word = params[:word].upcase.chars
    @letters = params[:letters].upcase.scan /\w/
    valid(@word)
    @check = existing_word?(@word)
    if @check 
      session[:score] += @word.length
    end
  end

  def valid(word)
    @valid = @word.all? { |l| @letters.include?(l) }
    @word = @word.join
    @letters = @letters.join
  end

  def reset
    session.delete(:score)
    redirect_to root_path
  end

  private
  
  # API
  def existing_word?(word)
    response = URI.open("https://wagon-dictionary.herokuapp.com/#{word}")
    json = JSON.parse(response.read)
    json['found']
  end
end