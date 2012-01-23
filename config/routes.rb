Senergy::Application.routes.draw do
  root :to => "homes#show"
  resource :session, :only => [:new, :create, :destroy, :show]

#  localize_and_scope_for(I18n.available_locales, :skip_scope => I18n.default_locale) do
#    match '/start/:id', :to => "homes#show", :as => :start
#    resource :home do
#      get :bye, :on => :member
#    end
#  end
end
