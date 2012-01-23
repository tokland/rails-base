require 'spec_helper'

describe 'home page', :type => :acceptance, :js => true do
  it 'should welcome the user' do
    visit '/'
    #puts page.body
    within('#content') do
      page.should have_content('hello')
    end
  end
end
