ActiveAdmin.register User do
  filter :email
  
  index do
    column :email
    
    default_actions
  end
     
  form do |f|
    f.inputs "Details" do
      f.input :email
    end
    
    f.buttons
  end
end
