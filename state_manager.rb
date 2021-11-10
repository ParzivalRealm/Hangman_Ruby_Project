module StateManager
  require 'yaml'
  def save_game()
    puts "do you wish to save the game?"
    player_response = gets.chomp
    if player_response == "y"
     f = File.new("./database.yaml", "w+")
     f.write(YAML::dump(self))
     f.close
      exit
    elsif player_response =="n"
  
    else
      puts "invalid selection"
    end
  end

  def load_game(yaml_string)
  
    YAML::load(yaml_string)
  end
  
end