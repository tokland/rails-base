ActiveAdmin.register Page do
  filter :key_or_title_or_body, :as => :string
  filter :id
  #filter :status, :as => :select, :collection => Page::Statuses
  
  scope :all, :default => true
  scope :published
  scope :draft

  show do
    attributes_table :id, :key, :status, :slug, :language, :title, :body_html
  end
    
  index do
    column :id
    column :key
    column :status
    column :slug
    column :language
    column :title
    
    default_actions
  end
     
  form do |f|
    f.inputs "Basic" do
      f.input :language, :as => :select, 
        :collection => AppConfig.languages, :include_blank => false
      f.input :key
      f.input :slug
      f.input :status, :as => :select, :collection => Page::Statuses, :include_blank => false
    end
    
    f.inputs "Contents" do
      f.input :title
      f.input :body, :input_html => {:id => "wmd-input"}
    end
    
    f.buttons
  end
end
