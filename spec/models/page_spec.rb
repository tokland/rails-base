require 'spec_helper'

describe Page do
  describe "validations" do
    subject { create(:page) }
  
    it { should validate_presence_of :title }
    it { should validate_presence_of(:state) }
    it { should allow_value("draft").for(:state) }
    it { should allow_value("published").for(:state) }
    it { should validate_uniqueness_of(:slug).scoped_to(:language) }
    it { should validate_presence_of(:key) }
    it { should validate_uniqueness_of(:key) }
  end
  
  describe "scopes" do
    before do
      @pages = {
        :published1 => create(:published_page), 
        :published2 => create(:published_page), 
        :draft1 => create(:draft_page),
        :draft2 => create(:draft_page),
      }
    end
    
    describe "draft" do
      it { Page.draft.should =~ @pages.values_at(:draft1, :draft2) }
    end

    describe "published" do
      it { Page.published.should =~ @pages.values_at(:published1, :published2) }
    end
  end
  
  describe "callbacks" do
    describe "before save" do
      it "should set markdown on body_html from body" do
        page = create(:page, :body => "*hello*")
        page.body_html.should == "<p><em>hello</em></p>"
      end
    end 
  end
end
