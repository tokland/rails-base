require 'spec_helper'

describe PagesHelper do
  before do 
    create(:draft_page, :title => 'mytitle', :key => 'mykey_draft') 
    create(:published_page, :title => 'mytitle', :key => 'mykey_published')
  end
    
  describe "link_to_page" do
    it "creates a link for existing page" do
      helper.link_to_page(:mykey_published).should =~ /mytitle/
    end

    it "shows a warning message for non-published page" do
      helper.link_to_page(:mykey_draft).should =~ /ERROR/
    end

    it "shows a warning message for non-existing page" do
      helper.link_to_page(:mykey_wrong).should =~ /ERROR/
    end
  end
end
