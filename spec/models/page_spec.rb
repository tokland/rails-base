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
end
