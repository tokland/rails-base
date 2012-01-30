require 'spec_helper'

describe PagesHelper do
  before { @page = Factory(:page, :title => 'mytitle', :key => 'mykey') }
    
  describe "link_to_page" do
    it "creates a link for page from symbol key" do
      helper.link_to_page(:mykey).should =~ /mytitle/
    end
  end
end
