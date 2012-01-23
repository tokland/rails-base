require 'spec_helper'

describe ApplicationHelper do
  describe "hello" do
    it { helper.hello.should == "hello" }
  end
end
