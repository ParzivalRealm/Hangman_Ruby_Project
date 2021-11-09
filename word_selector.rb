module WordSelector
  #This converts the dictitionary from strin to array and gets the word that will be guessed

  def get_word(dictionary)
    curated_word_list = Array.new
    dictionary_array = dictionary.split("\n")
    dictionary_array.each do |word|
        curated_word_list.push(word) if word.length.between?(5,12)
    end
    
    curated_word_list.sample
  end
  
end