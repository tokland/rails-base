require 'spec_helper'

describe HomesController do
  render_views

  describe "routing" do
    it { {:get => "/"}.should route_to(:controller => "homes", :action => "show") }
    #it { {:get => "/es/empezamos/5"}.should route_to(:controller => "homes", :action => "show", :i18n_locale => 'es', :id => '5') }
  end

  describe "GET #show" do
    before { get :show }

    it { response.should be_success }
    it { response.should render_template('show') }
    #it { response.should be_valid_xhtml }
  end
end
