class Page < ActiveRecord::Base
  States = ["draft", "published"]
  
  validates :language, :presence => true
  validates :key, :presence => true, :uniqueness => true
  validates :slug, :uniqueness => {:scope => :language}
  validates :title, :presence => true
  validates :state, :presence => true, :inclusion => {:in => States}
  
  scope :published, where(Page[:state] == "published")
  scope :draft, where(Page[:state] == "draft")
  
  before_save { |page| page.body_html = BlueCloth.new(body).to_html }
end
