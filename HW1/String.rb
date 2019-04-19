class String

  # counting the word occurences, ignore the words' uppercase of lowercase
  def count_word (str = nil)

    # check if the first parameter passed is a string, if not print a warning and return immediately
    if !(str.instance_of? String) and (str != nil)
      return "WARNING: you can input nothing or a string, but nothing else!"
    end

    #Hashmap to store the result of word counting
    words_count = Hash.new
    #Set default counting to 0
    words_count.default = 0

    # check if a string parameter is given, if not return # of occurence of each word in the original string
    if (str == nil)
      #get an array of the words by using regex to split the string at wherever is
      # not a word
      self.split(/\W+/).each do |word|
        words_count[word.downcase] += 1
      end
      return words_count
    end

    if (str != nil)
      str.downcase!
      self.split(/\W+/).each do |word|
        if (word.downcase <=> str) == 0
          words_count[str] += 1
        end
      end
      return words_count[str]
    end
  end
end