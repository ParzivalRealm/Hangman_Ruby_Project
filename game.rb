class Game
  require './texts.rb'
  require './word_selector.rb'
  require 'pry'
  include TextScripts
  extend WordSelector
  attr_accessor :word, :hidden_word, :remaining_lifes, :word_array

  def initialize(dictionary)
    @word = Game.get_word(dictionary)
    @hidden_word = Array.new
    @remaining_lifes = 5
    @word_array = word_array = word.split("")
    @wrong_responses_log = Array.new
    @game_ended_flag = false
    puts @word
  end

  #This grabs the word and replaces the letter with underscores
  def hide_word(word_array)
    word_array.map do |letter|
      letter = " _ "
      @hidden_word.push(letter)
    end
  end

  def turn()
    while @game_ended_flag == false do
      self.turn_text(@remaining_lifes, @hidden_word, @wrong_responses_log)
      get_player_response
    end
  end

  #this iterates over the guess word letters and replaces the hidden word with the matching letters
  def update_hidden_word(player_response)
    if @word_array.any?{|letter2| letter2 == player_response}
       @word_array.each_with_index do |word_letter, i|
        if word_letter == player_response
          @hidden_word[i] = word_letter
          next
        end
      end
    else
        @remaining_lifes = @remaining_lifes-1
        @wrong_responses_log.push(player_response)
        self.wrong_choice_text
    end
  end

  def get_player_response
    player_response = gets.chomp
    begin
      if  player_response.length == 1 && player_response.to_i.to_s != player_response
        update_hidden_word(player_response)
        is_game_ended?
      else
        self.invalid_response_text
        player_response = gets
        is_game_ended?
      end
    end
  end

  def is_game_ended?
    if @remaining_lifes == 0
      self.no_lifes_remaining_text(@word)
      @game_ended_flag = true
      turn()
    elsif @hidden_word.all?{|letter| letter != " _ "}
      self.win_text
      @game_ended_flag = true
      turn()
    else
      turn()
    end
    
  end
end