require 'spec_helper'

describe "Sort movies with a ratings checkbox" do
  before { create_movies }

  it "hides the G and PG movies" do
    visit movies_path
    # filter_movies
    uncheck 'ratings_G'
    uncheck 'ratings_PG'
    click_button 'Refresh'
    ['movie G', 'movie PG'].each do |filtered_movie|
      page.should_not have_content filtered_movie
    end
  end
end

def create_movies
  ['G','PG','PG-13','R'].each do |rating|
  	Movie.create(title: "movie #{rating}", rating: rating)
  end
end

def filter_movies
  uncheck 'ratings_G'
  uncheck 'ratings_PG'
  click_button 'Refresh'
end