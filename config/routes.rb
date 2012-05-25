Senergy::Application.routes.draw do
  root :to => "home#show"
  devise_for :users
  resources :pages

  ActiveAdmin.routes(self)
  devise_for :admin_users, ActiveAdmin::Devise.config
end

#ActionDispatch::Routing::Translator.translate_from_file('config/locales/routes.yml')
