require 'spec_helper'

describe Ability do
  describe "as normal user" do
    let(:user) { Factory(:user) }
    let(:page) { Factory(:page) }
    subject { Ability.new(user) }
    
    it { should be_able_to(:read, page) }
  end
end
