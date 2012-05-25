module Enumerable
  def map_compact(&block)
    self.map(&block).compact
  end

  def mash(&block)
    self.inject({}) do |hash, item|
      if (result = block_given? ? yield(item) : item)
        key, value = (result.is_a?(Array) ? result : [item, result])
        hash.update(key => value)
      else
        hash
      end
    end
  end

  def map_select(value_for_skip = nil)
    self.inject([]) do |acc, item|
      value = yield(item)
      value == value_for_skip ? acc : acc << value
    end
  end
  
  def map_detect(value_for_no_matching = nil, &block)
    self.each do |member|
      if result = yield(member)
        return result
      end
    end
    value_for_no_matching
  end
end

class MaybeWrapper
  instance_methods.each { |m| undef_method m unless m == :object_id || m =~ /^__/ }

  def method_missing(*args, &block)
    nil
  end
end

class String
  def splitAt(idx)
    [self[0...idx], self[idx..-1]] 
  end
end

class Object
  def to_bool
    !!self
  end

  def whitelist(*valids)
    valids.include?(self) ? self : nil
  end

  def blacklist(*valids)
    valids.include?(self) ? nil : self
  end

  def or_else(options = {}, &block)
    if options[:if]
      self.send(options[:if]) ? yield : self
    else
      self || yield
    end
  end

  def state_loop(initial_value, &block)
    value = initial_value
    loop do
      value = (yield value)
    end
  end

  def safe_loop(*exceptions)
    begin
      yield
    rescue *exceptions => exc
      retry
    end
  end

  def in?(enumerable)
    enumerable.include?(self)
  end

  def not_in?(enumerable)
    !enumerable.include?(self)
  end

  def maybe(&block)
    if block_given?
      nil? ? nil : yield(self)  
    else
      nil? ? MaybeWrapper.new : self
    end
  end
end

class OpenStruct
  def self.new_recursive(hash)
    hash2 = hash.mash do |key, value|
      value2 = value.is_a?(Hash) ? OpenStruct.new_recursive(value) : value
      [key, value2]
    end   
    OpenStruct.new(hash2)
  end
end

class Array
  def not_empty?
    !empty?
  end
end

class Hash
  def defaults(defaults)
    if (unknown_options = self.keys - defaults.keys).not_empty?
      raise ArgumentError.new("Unknown option(s) passed: #{unknown_options.join(', ')}")
    end
    replace(defaults.merge(self))
  end
end
