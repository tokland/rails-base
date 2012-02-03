require 'spec_helper'

describe Page do
  describe "validations" do
    subject { Factory(:page) }
  
    it { should validate_presence_of :title }
    it { should validate_presence_of(:status) }
    it { should allow_value("draft").for(:status) }
    it { should allow_value("published").for(:status) }
    it { should validate_uniqueness_of(:slug).scoped_to(:language) }
    it { should validate_presence_of(:key) }
    it { should validate_uniqueness_of(:key) }
  end
  
  describe "scopes" do
    before do
      @pages = {1 => Factory(:published_page), 2 => Factory(:draft_page),
                3 => Factory(:published_page), 4 => Factory(:draft_page)}
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
        page = Factory.create(:page, :body => "*hello*")
        page.body_html.should == "<p><em>hello</em></p>"
      end
    end 
  end
end
