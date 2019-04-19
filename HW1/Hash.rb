class Hash
  def merge(map2, &block)
    #puts "!!! implementing my own version of merge()"

    # clone map1 into result; it's shadow copy, but okay with this
    result = self.clone

    map2.each do |key, val| 
      # case 1: key not contained in map1
      unless result.has_key? (key)
        result[key] = val
        next
      end
      # case 2: key contained in map1, and no block given
      unless block_given?
        result[key] = map2[key]
        next
      end

      # case 3: key contained in map1, and block gives
      result[key] = block.call(key, result[key], map2[key])
    end

    #return result without changing self
    result
  end


  def merge!(map2, &block)
    map2.each do |key, val| 
      # case 1: key not contained in map1
      unless self.has_key? (key)
        self[key] = val
        next
      end
      # case 2: key contained in map1, and no block given
      unless block_given?
        self[key] = map2[key]
        next
      end

      # case 3: key contained in map1, and block gives
      self[key] = block.call(key, self[key], map2[key])
    end
    # return modified self
    self
  end
end


