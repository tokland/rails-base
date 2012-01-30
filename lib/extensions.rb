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
  instance_methods.each { |m| undef_method m unless m =~ /^__/ || m == :object_id }

  def method_missing(*args, &block)
    nil
  end
end

class Object
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

  def maybe
    self.nil? ? MaybeWrapper.new : self
  end
end
