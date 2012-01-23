require 'active_record'
require 'arel'

# Ruby-like syntax for ActiveRecord+Arel conditions. This standard code:
#
#   >> User.where(["users.created_at > ? AND users.name LIKE ?", Date.yesterday, "Mary"])
#
# can be written like this:
# 
#   >> User.where((User[:created_at] > Date.yesterday) & (User[:name] =~ "Mary"))
#
module ArelExtensions
  module ActiveRecord
    module ClassMethods
      delegate :[], :to => :arel_table
    end
  end
  
  Nodes = proc do
    alias_method :&, :and
    alias_method :|, :or
  end

  Predications = proc do
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

ActiveRecord::Base.extend(ArelExtensions::ActiveRecord::ClassMethods)
Arel::Nodes::Node.class_eval(&ArelExtensions::Nodes)
Arel::Predications.class_eval(&ArelExtensions::Predications)
