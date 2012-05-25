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
        1 => create(:published_page), 
        2 => create(:draft_page),
        3 => create(:published_page), 
        4 => create(:draft_page),
      }
    end
    
    describe "draft" do
      it { Page.draft.should =~ @pages.values_at(2, 4) }
    end

    describe "published" do
      it { Page.published.should =~ @pages.values_at(1, 3) }
    end
  end
  
  describe "callbacks" do
    describe "before save" do
      it "should set body_html from body (markdown format)" do
        page = create(:page, :body => "*hello*")
        page.body_html.should == "<p><em>hello</em></p>"
      end
    end 
  end
end
