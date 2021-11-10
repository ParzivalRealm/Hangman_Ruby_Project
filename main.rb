require './game.rb'
require './texts.rb'
require './state_manager.rb'
extend TextScripts

#This is the file that will containts the full word list
puts "Do you want to resume a game?"
response = gets.chomp
game = Game.new(File.read('./5desk.txt'), response) 
game.hide_word(game.word_array)
game.first_text
game.turn()






#Dictionary has words that will be selected based on rules and then choose one of the curated word list

#Game will start and needs to be saved. possibly in a hash like a Json that will have inside the player information and the status of which letters of the word have been guessed

#After each guess of the player, it needs to update the life counter and the status of the guessed word
#Player has lifes that will need to be substracted





#Word selector based on rules

#Word selector that will assign word to game