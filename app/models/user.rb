class User < ActiveRecord::Base
  include Clearance::User
  store :settings,  accessors: [:color, :age]
  
  def hello
    "hello"
  end    
end
