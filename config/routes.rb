Senergy::Application.routes.draw do
  ActiveAdmin.routes(self)
  devise_for :admin_users, ActiveAdmin::Devise.config
  
  root :to => "homes#show"
  resources :pages
  devise_for :users
end

# ActionDispatch::Routing::Translator.translate_from_file('config/locales/routes.yml')
