module Enumerable
  # Your code goes here
  def my_each_with_index(&block)
    i = 0
    self.my_each do |element|
      block.call(element, i)
      i += 1
    end
    self
  end

  def my_select(&block)
    results = []
    self.my_each do |element|
      results << element if block.call(element)
    end
    results
  end

  def my_all?(&block)
    self.my_each do |element|
      return false unless block.call(element)
    end
    return true
  end

  def my_any?(&block)
    self.my_each do |element|
      return true if block.call(element)
    end
    return false
  end

  def my_none?(&block)
    self.my_each do |element|
      return false if block.call(element)
    end
    return true
  end

  def my_count(&block)
    return self.size unless block_given?

    results = 0
    self.my_each do |element|
      results += 1 if block.call(element)
    end
    results
  end

  def my_map(&block)
    results = []

    self.my_each do |element|
      results << block.call(element)
    end
    results
  end

  def my_inject(initial_value, &block)
    result = initial_value
    self.my_each do |element|
      result = block.call(result, element)
    end
    result
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each(&block)
    i = 0
    while i < self.length
      block.call(self[i])
      i += 1
    end
    self
  end
end
