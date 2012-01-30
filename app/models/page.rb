class Page < ActiveRecord::Base
  Statuses = ["draft", "published"]
  
  validates :language, :presence => true
  validates :key, :presence => true, :uniqueness => true
  validates :slug, :uniqueness => {:scope => :language}
  validates :title, :presence => true
  validates :status, :presence => true, :inclusion => {:in => Statuses}
end
