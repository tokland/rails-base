class Page < ActiveRecord::Base
  Statuses = ["draft", "published"]
  
  validates :language, :presence => true
  validates :key, :presence => true, :uniqueness => true
  validates :slug, :uniqueness => {:scope => :language}
  validates :title, :presence => true
  validates :status, :presence => true, :inclusion => {:in => Statuses}
  
  before_save { |page| page.body_html = BlueCloth.new(body).to_html }
end
