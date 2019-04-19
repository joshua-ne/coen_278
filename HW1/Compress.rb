class Compress
  attr_reader :words, :indexes, :original_string

  def initialize(*str)
    # parameter check, if more than one arguments provided, or nothing provide, or provide with 
    # a non-string argument, print warning and return nil immediately
    if str.size > 1 || str.size < 1 || (!str[0].instance_of?(String))
      puts "WARNING: Invalid Parameter! Please Initialize with a Valid String"
      return nil
    end

    # build words map using the helper function
    words_map = build_words_map(str[0])

    # declare instance variables
    # @original_string to store the original string
    # @words to store word list
    # @indexes to store the index of each word in the original string
    @original_string = str[0]
    @words = Array.new
    @indexes = Array.new

    # initialize the word index counter
    word_counter = 0
    # go through the word map, push word into @words one at a time 
    # and set the corresponding indexes to the index of the word
    words_map.each do |word, index_array|
      @words.push word
      index_array.each do |index|
        @indexes[index] = word_counter
      end
      word_counter += 1
    end
  end


  def build_words_map(str)
    # declare words_map
    # default value to be an empty list

    words_map = Hash.new

    # go through each word in the string, add to the map
    # the key is a list to record the position of the word in the string

    # counter to count the index of the word in the string
    counter = 0 
    str.split(/\W+/).each do |word|
      if (word != nil)
        if (!words_map.include? word)
          words_map[word] = Array.new
        end
        words_map[word].push(counter)
        counter += 1
      end
    end
    return words_map
  end
end