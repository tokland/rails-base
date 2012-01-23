require 'spec_helper'

describe User do
  let(:user) { Factory(:user) }

  describe "validations" do
    it { should validate_presence_of :email }
  end
    
  describe "#hello" do
    it { user.hello.should == "hello" }
  end
end
