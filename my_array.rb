class Array
  def my_each(argument = nil)
    i = 0
    while !self[i].nil? do
      if block_given?
        yield(self[i])
      else
        argument.call(self[i])
      end
      i += 1
    end
    self
  end

  def my_map(argument = nil)
    result = []
    self.my_each do |value|
      if block_given?
        result.push(yield(value))
      else
        result.push(argument.call(value))
      end
    end
    result
  end

  def my_select(argument = nil)
    result = []
    self.my_each do |value|
      if block_given?
        if yield(value)
          result.push(value)
        end
      else
        if argument.call(value)
          result.push(value)
        end
      end
    end
    result
  end

  def my_all?(argument = nil)
    self.my_each do |value|
      if block_given?
        unless yield(value)
          return false
        end
      else
        unless argument.call(value)
          return false
        end
      end
    end
    return true
  end

  def my_inject(arg = 0, argument = nil)
    result = arg
    self.my_each do |item|
      if block_given?
        result = yield(result, item)
      else
        result = argument.call(result, item)
      end
    end
    result
  end
end


[1, 2, 5].my_map {|num| num ** 2}