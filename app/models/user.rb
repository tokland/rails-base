class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  attr_accessible :email, :password, :password_confirmation, :remember_me
  store :settings,  accessors: [:color, :age]
  scope :me, where(:email => "tokland@gmail.com")
end
