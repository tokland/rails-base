class User < ActiveRecord::Base
  include Clearance::User
  
  def hello
    "hello"
  end    
end
