require 'spec_helper'

describe PagesHelper do
  before { @page = Factory(:page, :title => 'mytitle', :key => 'mykey') }
    
  describe "link_to_page" do
    it "creates a link for existing page" do
      helper.link_to_page(:mykey).should =~ /mytitle/
    end

    it "shows a warning message for non-existing page" do
      helper.link_to_page(:nonexisting_mykey).should =~ /ERROR/
    end
  end
end
