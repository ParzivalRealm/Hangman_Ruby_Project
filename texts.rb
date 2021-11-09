module TextScripts
  def first_text
    puts "You have 5 attempts to guess the word below. each underscore represents a letter. \n please write a letter or word to see if it matches any letter from the hidden word \n Good luck!"
  end

  def turn_text(lifes,hidden_word, wrong_responses_log)
    hidden_word.each do |letter|
      print letter
    end
    print "\n"
    puts "You have #{lifes} lifes remaining, please write a letter or word to see if it matches any letter of the guess word. \n These are the letters that you choose and do not belong to the word: #{wrong_responses_log}"
  end

  def wrong_choice_text
    puts "Oops, that letter is not on the word, you lose 1 life"
  end

  def invalid_response_text
    puts "Sorry you can only put 1 letter per turn"
  end

  def no_lifes_remaining_text(word)
    puts "I'm Sorry, you do not have more lifes remaining, the correct word was: #{word}"
  end

  def win_text
    puts "Congratulaions, you've guessed the word"
  end

  
  
  
end