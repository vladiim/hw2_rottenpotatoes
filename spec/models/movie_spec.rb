require 'spec_helper'

describe Movie do
  describe '.sort_by' do
  	let(:result) { Movie.sort_by(column) }
  	context 'no column' do
  	  let(:column) { nil }

      before { mock(Movie).order(nil) { 'ALL MOVIES' } }

      it 'returns all the movies' do
      	result.should eq 'ALL MOVIES'
      end
  	end

    context 'title' do
      let(:column) { 'title' }

      before { mock(Movie).order('title') { 'MOVIES ORDERED BY TITLE' } }

      it 'returns the movies ordered by title' do
        result.should eq 'MOVIES ORDERED BY TITLE'
      end
    end
  end

  describe '.filter_ratings' do
    let(:ratings) { ['G', 'PG'] }
    let(:result)  { Movie.filter_ratings(ratings) }

    before { mock(Movie).where(ratings: ratings) { 'MOVIES FILTERED BY RATINGS' } }

    it 'returns the movies filtered by ratings' do
      result.should eq 'MOVIES FILTERED BY RATINGS'
    end
  end
end