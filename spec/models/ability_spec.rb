require 'spec_helper'

describe Ability do
  describe "normal user" do
    let(:user) { create(:user) }
    let(:page) { create(:page) }
    subject { Ability.new(user) }
    
    it { should be_able_to(:read, page) }
  end
end
