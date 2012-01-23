require 'spec_helper'

describe User do
  let(:user) { Factory(:user) }
  
  context "with long email" do
    let(:user) { Factory(:user, :email => 'aaaaaaaaaaaaaaa@gmail.com') }
    
    it { user.hello.should == "hello" }
  end
  
  describe "#hello" do
    it { user.hello.should == "hello" }
    it { should validate_presence_of :email }
  end
end
