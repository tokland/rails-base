require 'spec_helper'

describe Ability do
  describe "normal user" do
    let(:user) { Factory(:user) }
    let(:page) { Factory(:page) }
    subject { Ability.new(user) }
    
    it { should be_able_to(:read, page) }
  end
end
