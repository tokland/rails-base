class Page < ActiveRecord::Base
  Statuses = ["draft", "published"]
  
  validates :language, :presence => true
  validates :key, :presence => true, :uniqueness => true
  validates :slug, :uniqueness => {:scope => :language}
  validates :title, :presence => true
  validates :status, :presence => true, :inclusion => {:in => Statuses}
  
  scope :published, where(:status => "published")
  scope :draft, where(:status => "draft")
  
  before_save { |page| page.body_html = BlueCloth.new(body).to_html }
end
