Senergy::Application.routes.draw do
  root :to => "homes#show"
  resource :session, :only => [:new, :create, :destroy, :show]
end
