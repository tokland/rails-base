require 'spec_helper'

describe HomesController do
  before { seed_database }
   
  render_views

  describe "routing" do
    it { {:get => "/"}.should route_to(:controller => "homes", :action => "show") }
  end

  describe "GET #show" do
    before { get :show }

    it { response.should be_success }
    it { response.should render_template('show') }
    #it { response.should be_valid_xhtml }
  end
end
