require 'action_view/helpers/output_safety_helper'

module Helpers
  extend ActionView::Helpers::OutputSafetyHelper
end

class Array
  def safe_join(joinchar = nil)
    Helpers.safe_join(self, joinchar) 
  end
end

module ActiveRecord
  class RollbackAndReturn < Exception
    attr_accessor :value
    
    def initialize(value)
      @value = value
    end
  end
  
  module Transactions
    module ClassMethods
      def transaction_enhanced(options = {})
        return_value = nil 
        transaction do
          begin
            return_value = yield
          rescue ActiveRecord::RollbackAndReturn => exc
            return_value = exc.value
            raise ActiveRecord::Rollback
          end           
          raise ActiveRecord::Rollback if options[:force_rollback]
        end
        return_value
      end
    end
  end
end
