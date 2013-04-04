require 'spec_helper'

describe 'order movies' do
  before do
  	Movie.create(title: 'CCCC')
  	Movie.create(title: 'BBBB')
  	Movie.create(title: 'AAAA')
  	visit movies_path
  end

  describe 'Click Movie Title' do
  	before do
  	  within('thead') do
  	  	click_link 'Movie Title'
  	  end
  	end

    it 'orders the movies alphabetically' do
      page.should have_selector('tbody tr:nth-child(1)', text: 'AAAA')
      # page.should have_selector('tbody tr:nth-child(2)', text: 'BBBB')
      # page.should have_selector('tbody tr:nth-child(3)', text: 'CCCC')
    end
  end
end