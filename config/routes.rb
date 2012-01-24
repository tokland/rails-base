Senergy::Application.routes.draw do
  ActiveAdmin.routes(self)

  devise_for :admin_users, ActiveAdmin::Devise.config

  root :to => "homes#show"
  resource :session, :only => [:new, :create, :destroy, :show]
end
