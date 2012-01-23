describe User do
  let(:user) { Factory(:user) }
  
  describe "#hello" do
    it { user.hello.should == "hello" }
  end
end
