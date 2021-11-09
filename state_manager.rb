module StateManager
  def save_game
    YAML::dump(self)
  end

  def load_game(yaml_string)
    YAML::load(yaml_string)
  end
  
end