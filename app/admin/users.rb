ActiveAdmin.register User do
  filter :email
  
  index do
    column :id
    column :email
    column :last_sign_in_at
    
    default_actions
  end
     
  form do |f|
    f.inputs "Details" do
      f.input :email
    end
    
    f.buttons
  end
end
