ActiveAdmin.register Page do
  filter :key_or_title_or_body, :as => :string
  
  scope :all, :default => true
  scope :published
  scope :draft

  show do
    attributes_table do
      row :key
      row(:state) { |page| page.state_translated }
      row :slug
      row :language
      row :title
      row(:body_html) { |page| render_page(page) }
    end
  end
    
  index do
    column :key
    column(:state, :sortable => :state) { |page| page.state_translated }
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
      f.input :state, :as => :select, :collection => Page::StatesTranslated, :include_blank => false
    end
    
    f.inputs "Contents" do
      f.input :title
      f.input :body, :input_html => {:id => "wmd-input"}
    end
    
    f.buttons
  end
end
