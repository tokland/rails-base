require 'active_record'
require 'arel'

# Ruby-like syntax in AR conditions using the underlying Arel layer (Rails >= 3.0).
#
# What you would usually write like this: 
#
#   User.where(["users.created_at > ? AND users.name LIKE ?", Date.yesterday, "Mary"])
#
# can now be written like this:
# 
#   User.where((User[:created_at] > Date.yesterday) & (User[:name] =~ "Mary"))
#
module ArelExtensions
  module ActiveRecord
    module ClassMethods
      delegate :[], :to => :arel_table
    end
  end
  
  module Nodes
    def self.included(base)
      base.class_eval do 
        alias_method :&, :and
        alias_method :|, :or
      end
    end
  end

  module Predications
    def self.included(base)
      base.class_eval do
        alias_method :<,  :lt
        alias_method :<=, :lteq
        alias_method :==, :eq
        alias_method :>=, :gteq
        alias_method :>,  :gt
        alias_method :=~, :matches
        alias_method :^,  :not_eq
        alias_method :>>, :in
        alias_method :<<, :not_in
      end
    end
  end  
end

ActiveRecord::Base.extend(ArelExtensions::ActiveRecord::ClassMethods)
Arel::Nodes::Node.send(:include, ArelExtensions::Nodes) 
Arel::Predications.send(:include, ArelExtensions::Predications)
