module Enumerable
  def my_each
    i = 0
    while i < length
      yield self[i] unless is_a?(Hash)
      yield [keys[i], values[i]] if is_a?(Hash)
      i += 1
    end
    self
  end

  def my_each_with_index
    i = 0
    while i < length
      yield self[i], i unless is_a?(Hash)
      yield [keys[i], values[i], i] if is_a?(Hash)
      i += 1
    end
    self
  end

  def my_select
    result = []
    my_each { |x| result << x if yield(x) }
    result
  end

  def my_all?
    result = []
    my_each { |x| result << x if yield(x) }
    result == self
  end

  def my_any?
    result = []
    my_each { |x| result << x if yield(x) }
    if result.empty?
      false
    else
      true
    end
  end

  def my_none?
    result = []
    my_each { |x| result << x if yield(x)}
    return result.empty?
  end

  def my_count
    result = []
    if block_given?
      my_each { |x| result << x if yield(x)}
      return result.length
    else
      return self.length
    end
  end

  def my_map
    result = []
    if block_given?
      my_each { |x| result << yield(x)}
      result
    else
      self
    end
  end

  def my_inject
    i = 0
    while i < length - 1
      result = yield(result, self[i = 1])
      i += 1
    end
    return result
  end
end
