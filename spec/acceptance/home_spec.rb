require 'spec_helper'

describe 'home page', :type => :acceptance, :js => true do
  before { seed_database }
  
  it 'should welcome the user' do
    visit '/'
    
    within('#content') do
      page.should have_content('hello arnau')
    end
  end
end
