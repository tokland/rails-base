ActiveAdmin.register Page do
  filter :key_or_title_or_body, :as => :string
  filter :status, :as => :select, :collection => Page::Statuses
  
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
      f.input :body
    end
    
    f.buttons
  end
end
